#!/bin/bash

function getSons {
    local PARENT=${1}
    local LEVEL=${2}
    local SONS=`grep -l "/${PARENT}:" **/Dockerfile`
    for SON in ${SONS};
    do
        local SON_CLEAN=${SON%%/*}
        echo "#${LEVEL}> ${SON_CLEAN}:`cat ${SON_CLEAN}/tag` FROM ${PARENT}:`cat ${PARENT}/tag`" >> build_all
        echo "#${LEVEL}> ${SON_CLEAN}:`cat ${SON_CLEAN}/tag` FROM ${PARENT}:`cat ${PARENT}/tag`" >> tree
        echo "build_push_image ${SON_CLEAN}/ ${SON_CLEAN}:`cat ${SON_CLEAN}/tag`" >> build_all
        getSons ${SON_CLEAN} "${LEVEL}-"
    done
}

function checkOrphans {
    local numberOfDockerImages=`ls -d1 */ | wc -l`
    local numberOfDockerImagesToBuild=`cat tree | wc -l`
    if [[ "${numberOfDockerImages}" != "${numberOfDockerImagesToBuild}" ]] ; then
       echo "WARNING, AN IMAGE IS NOT PRESENT IN THE HIERARCHY, IT MEANS THAT IT DOESNT BELONG TO base OR one of it's SON"
       exit 1
    fi
}

function addOrphan {
    local orphan=${1}
    echo "#${orphan}" >> build_all
    echo "#${orphan}:`cat ${orphan}/tag`" >> tree
    echo "build_push_image ${orphan}/ ${orphan}:`cat ${orphan}/tag`" >> build_all
}

function main {
    rm -f tree build_all
    touch build_all
    chmod +x build_all
    cat <<EOT >> build_all
#!/bin/bash
set -e
source _utils.sh
EOT
    PARENT="base"
    echo "#${PARENT}" >> build_all
    echo "#${PARENT}:`cat ${PARENT}/tag`" >> tree
    echo "build_push_image ${PARENT}/ ${PARENT}:`cat ${PARENT}/tag`" >> build_all
    getSons ${PARENT} "-"
    addOrphan "mysql"
    checkOrphans
}

main
