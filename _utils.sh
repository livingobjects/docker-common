#!/bin/bash
set -e

function build_push_image(){
    REPOSITORY="livingobjects"
    DIR=${1}
    IMAGE=${2}

    echo "*****************************************************************"
    echo "**************** Building/Pushing image ${IMAGE} ****************"
    echo "*****************************************************************"
    docker build -t ${REPOSITORY}/${IMAGE} ${DIR}
    docker push ${REPOSITORY}/${IMAGE}
}

function clean_image(){
    REPOSITORY="livingobjects"
    IMAGE=${1}

    docker rmi ${REPOSITORY}/${IMAGE}
}