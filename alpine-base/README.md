# Internal base docker image

[![](https://badge.imagelayers.io/livingobjects/base:latest.svg)](https://imagelayers.io/?images=livingobjects/base:latest 'Get your own badge on imagelayers.io')

Alpine based with: 
 * **runit** for services management
 * **wget**
 * **bzip2** 

## Build

Done automatically by docker hub

    docker build -t livingobjects/base .
    docker push livingobjects/base


## Test

    docker run -d livingobjects/base /bin/bash

## Changelog

### 2016-01-28
 * First Public release using alpine 3.3
