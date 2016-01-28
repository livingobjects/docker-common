# Neo4J
Based on jre8 neo4j launched and listening on port 7474 VOLUME: /opt/neo4j/data/graph.db

## Build

    docker build -t livingobjects/neo4j .
    docker push livingobjects/neo4j
    
## Test

    docker run -d livingobjects/neo4j /bin/bash

## Changelog

### 2016-01-28
* First OSS release
