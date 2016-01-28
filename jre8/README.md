# Jre8 image
Based on livingobjects/base we add a JRE

`JAVA_HOME` is set

## Build

    docker build -t livingobjects/jre8 .
    docker push livingobjects/jre8


## Test

    docker run -d livingobjects/jre8

## Changelog

### 2016-01-28
 * First OSS release