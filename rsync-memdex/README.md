# Rsync

[![](https://badge.imagelayers.io/livingobjects/rsync:latest.svg)](https://imagelayers.io/?images=livingobjects/rsync-memdex:latest 'Get your own badge on imagelayers.io')

A docker image to launch lsyncd commands

## Build

    docker build -t livingobjects/rsync-memdex .
    docker push livingobjects/rsync-memdex

Test :

    docker run -d livingobjects/rsync-memdex

## Changelog

### 2016-07-21
* First release (copy from rsync docker)