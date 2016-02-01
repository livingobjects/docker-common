# Used for netflow/snmp collectors

[![](https://badge.imagelayers.io/livingobjects/jre8_collector_tools:latest.svg)](https://imagelayers.io/?images=livingobjects/jre8_collector_tools:latest 'Get your own badge on imagelayers.io')

Based on jre8

## Build

    docker build -t livingobjects/jre8_collector_tools .
    docker push livingobjects/jre8_collector_tools


## Test 

    docker run -d livingobjects/jre8_collector_tools /bin/bash

## Changelog

### 2016-01-28
 * Initial OSS release