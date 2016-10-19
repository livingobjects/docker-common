# Neo4j

[![](https://badge.imagelayers.io/livingobjects/neo4j:latest.svg)](https://imagelayers.io/?images=livingobjects/neo4j:latest 'Get your own badge on imagelayers.io')

Based on jre8 neo4j launched and listening on port 7474 VOLUME: /opt/neo4j/data/graph.db

## Build

    docker build -t livingobjects/neo4j .
    docker push livingobjects/neo4j
    
## Test

    docker run -d livingobjects/neo4j /bin/bash

## Changelog

### 2016-08-30
 * Release extension to 1.4
 * Update to neo4j 2.3.6

### 2016-06-28
 * Release extension to 1.3

### 2016-05-23
 * Update neo4j-lo-extension

### 2016-05-11
 * Update neo4j-lo-extension
 
### 2016-04-27
 * Update neo4j-lo-extension
 
### 2016-04-21
 * Update neo4j-lo-extension
 * remove cosmos-shared dependency
 * rollback to 2.3.2 due to a bug in 2.3.3
 
### 2016-01-28
* First OSS release

