# Neo4J

[![](https://badge.imagelayers.io/livingobjects/neo4j:latest.svg)](https://imagelayers.io/?images=livingobjects/neo4j:latest 'Get your own badge on imagelayers.io')

Based on jre8 neo4j launched and listening on port 7474 VOLUME: /opt/neo4j/data/graph.db

## Build

    docker build -t livingobjects/neo4j .
    docker push livingobjects/neo4j
    
## Test

    docker run -d livingobjects/neo4j /bin/bash

## Changelog

### 2016-01-28
* First OSS release
