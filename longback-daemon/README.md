# Wisdom base image

[![](https://badge.imagelayers.io/livingobjects/longback-daemon:latest.svg)](https://imagelayers.io/?images=livingobjects/longback-daemon:latest 'Get your own badge on imagelayers.io')

Based on jre8

## Build

    docker build -t livingobjects/longback-daemon .
    docker push livingobjects/longback-daemon

## Test

    docker run -d livingobjects/longback-daemon

## Changelog

### 2017-08-29 - Version : longback-daemon_1.0_22
* logger : rename achived logs from wisdom to info

### 2017-08-21 - Version : longback-daemon_1.0_18
* Improve logger configuration

### 2017-05-17 - Version : longback-daemon_1.0_16
* New debian-base

### 2017-05-05 - Version : longback-daemon_1.0_15
* Switch to debian-base : jr8 version : jre8_8u121_3

### 2016-05-26
* Archive update osgi-runtime 2.0-SNAPSHOT

### 2016-01-29
* First OSS release
