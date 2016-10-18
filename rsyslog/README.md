# Rsync

[![](https://badge.imagelayers.io/livingobjects/rsyslog:latest.svg)](https://imagelayers.io/?images=livingobjects/rsyslog:latest 'Get your own badge on imagelayers.io')

A docker image to centralize logs

## Build

    docker build -t livingobjects/rsyslog .
    docker login
    docker push livingobjects/rsyslog

Test :

    docker run -d livingobjects/rsyslog

## Changelog

### 2016-10-18
* First Image release
