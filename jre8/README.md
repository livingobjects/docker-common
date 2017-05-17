# Jre8 image

[![](https://badge.imagelayers.io/livingobjects/jre8:latest.svg)](https://imagelayers.io/?images=livingobjects/jre8:latest 'Get your own badge on imagelayers.io')

Based on livingobjects/base we add a JRE

`JAVA_HOME` is set

## Build

    docker build -t livingobjects/jre8 .
    docker push livingobjects/jre8


## Test

    docker run -d livingobjects/jre8

## Changelog

### 2017-05-17 - Version : jre8_8u121_4
* New debian-base

### 2017-05-05 - Version : jre8_8u121_3
* Switch to debian-base:8.7_1

### 2016-01-28
 * First OSS release