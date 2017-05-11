# Wisdom base image

[![](https://badge.imagelayers.io/livingobjects/longback-daemon:latest.svg)](https://imagelayers.io/?images=livingobjects/longback-daemon:latest 'Get your own badge on imagelayers.io')

Based on jre8

## Build

    docker build -t livingobjects/longback-daemon .
    docker push livingobjects/longback-daemon

## Test

    docker run -d livingobjects/longback-daemon

## Changelog

### 2017-05-05 - Version : longback-daemon_1.0_15
* Switch to debian-base : jr8 version : jre8_8u121_3

### 2016-05-26
* Archive update osgi-runtime 2.0-SNAPSHOT

### 2016-01-29
* First OSS release
