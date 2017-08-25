#!/bin/bash

function finish {
  rm -rf /tmp/archives
  rm -f archives.tar.gz.old
}
trap finish EXIT


OSGI_LAUNCHER_VERSION=2.2-SNAPSHOT
OSGI_RUNTIME_VERSION=2.2-SNAPSHOT
LO_JACKSON_RUNTIME_VERSION=2.5
LO_WISDOM_VERSION=0.9.1_3
WISDOM_MONITOR_APP_VERSION=0.9.1_4

mkdir -p /tmp/archives
curl -sS -o "/tmp/archives/osgi-launcher-${OSGI_LAUNCHER_VERSION}.tar.gz" -J \
    "http://nexus.livingobjects.com:8081/nexus/service/local/artifact/maven/content?r=public&g=com.livingobjects&a=osgi-launcher&v=${OSGI_LAUNCHER_VERSION}&p=tar.gz"
curl -sS -o "/tmp/archives/osgi-runtime-${OSGI_RUNTIME_VERSION}.tar.gz" -J \
    "http://nexus.livingobjects.com:8081/nexus/service/local/artifact/maven/content?r=public&g=com.livingobjects&a=osgi-runtime&v=${OSGI_RUNTIME_VERSION}&p=tar.gz"
curl -sS -o "/tmp/archives/lo-jackson-runtime-${LO_JACKSON_RUNTIME_VERSION}.tar.gz" -J \
    "http://nexus.livingobjects.com:8081/nexus/service/local/artifact/maven/content?r=public&g=com.livingobjects.longback&a=lo-jackson-runtime&v=${LO_JACKSON_RUNTIME_VERSION}&p=tar.gz"
curl -sS -o "/tmp/archives/lo-wisdom-runtime-${LO_WISDOM_VERSION}.tar.gz" -J \
    "http://nexus.livingobjects.com:8081/nexus/service/local/artifact/maven/content?r=public&g=com.livingobjects.longback&a=lo-wisdom-runtime&v=${LO_WISDOM_VERSION}&p=tar.gz"
curl -sS -o "/tmp/archives/wisdom-monitor-application-${WISDOM_MONITOR_APP_VERSION}.tar.gz" -J \
    "http://nexus.livingobjects.com:8081/nexus/service/local/artifact/maven/content?r=public&g=com.livingobjects.longback&a=wisdom-monitor-application&v=${WISDOM_MONITOR_APP_VERSION}&p=tar.gz"
curl -sS -o "/tmp/archives/wisdom-monitor-application-${WISDOM_MONITOR_APP_VERSION}-deps.tar.gz" -J \
    "http://nexus.livingobjects.com:8081/nexus/service/local/artifact/maven/content?r=public&g=com.livingobjects.longback&a=wisdom-monitor-application&c=deps&v=${WISDOM_MONITOR_APP_VERSION}&p=tar.gz"

mv archives.tar.gz archives.tar.gz.old
tar -zcvf archives.tar.gz -C /tmp archives

sed -i -E "s/OSGI_LAUNCHER_VERSION=([0-9A-Z\.\_-]+)/OSGI_LAUNCHER_VERSION=${OSGI_LAUNCHER_VERSION}/g" Dockerfile
sed -i -E "s/OSGI_RUNTIME_VERSION=([0-9A-Z\.\_-]+)/OSGI_RUNTIME_VERSION=${OSGI_RUNTIME_VERSION}/g" Dockerfile
sed -i -E "s/LO_JACKSON_RUNTIME_VERSION=([0-9A-Z\.\_-]+)/LO_JACKSON_RUNTIME_VERSION=${LO_JACKSON_RUNTIME_VERSION}/g" Dockerfile
sed -i -E "s/LO_WISDOM_VERSION=([0-9A-Z\.\_-]+)/LO_WISDOM_VERSION=${LO_WISDOM_VERSION}/g" Dockerfile
sed -i -E "s/WISDOM_MONITOR_APP_VERSION=([0-9A-Z\.\_-]+)/WISDOM_MONITOR_APP_VERSION=${WISDOM_MONITOR_APP_VERSION}/g" Dockerfile
