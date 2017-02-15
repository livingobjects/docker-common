#!/bin/sh

PRG="$0"
# resolve relative/absolute symlinks
while [ -h "${PRG}" ] ; do
  ls=`ls -ld "${PRG}"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG="`dirname "${PRG}"`/$link"
  fi
done
dir=`dirname ${PRG}`

if [ -z "$JAVA_HOME" ]; then
  JAVA="java"
else
  JAVA="$JAVA_HOME/bin/java"
fi

if [ "$ENABLE_DEBUG" = "true" ]; then
    DBG_OPTION="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"
fi

if test "$1" = "status"; then
    if [ -f RUNNING_PID ]; then
        pid=`cat RUNNING_PID`
        if ps -p $pid > /dev/null
        then
             echo "[info] felix running in the process ${pid}"
             exit 0
        else
             echo "[error] felix should be running in the process ${pid}, but the process does not exist"
             exit 1
        fi
    else
        echo "[info] No RUNNING_PID file. Felix not running"
        exit 3
    fi
fi

if test "$1" = "clean-all"; then
  rm -rf .config-admin
  rm -rf felix-cache
  rm -rf logs
  if [ $# -ne 1 ]
  then
   shift
  else
    echo "[info] Done!"
    exit 0
  fi
fi

if test "$1" = "stop"; then
  if [ -f RUNNING_PID ]; then
    echo "[info] Stopping felix (with PID `cat RUNNING_PID`)..."
    kill `cat RUNNING_PID`

    RESULT=$?
    if test "$RESULT" = 0; then
      echo "[info] Done!"
      rm RUNNING_PID
      exit 0
    else
      echo "[error] Failed ($RESULT)"
      exit ${RESULT}
    fi
  else
    echo "[error] No RUNNING_PID file. Is this felix running?"
    exit 1
  fi
fi


# Check if the RUNNING_PID file is not there already
if [ -f RUNNING_PID ]; then
    echo "[error] RUNNING_PID existing. Is this felix already running?"
    exit 1
fi

#CLASSPATH=$(JARS=("bin"/*.jar); IFS=:; echo "${JARS[*]}")
cd ${dir}
for i in `ls ./bin/*.jar`
do
  CLASSPATH=${CLASSPATH}:${i}
done

"$JAVA" \
    -cp ${CLASSPATH} \
    ${JVM_ARGS} \
    ${DBG_OPTION} \
    -Dlogback.configurationFile=conf/logger.xml \
    -Dfelix.config.properties=file:conf/felix.config.properties \
    -Dgosh.args="--noshutdown -c telnetd start" \
    org.apache.felix.main.Main \
    "$@"
