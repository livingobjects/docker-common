FROM livingobjects/jre8:8u71

ENV NEO4J_VERSION 2.3.2

# Install Neo4j Community
RUN wget --content-disposition http://neo4j.com/artifact.php\?name\=neo4j-community-${NEO4J_VERSION}-unix.tar.gz && \
    mkdir -p /opt && \
    tar xvfz neo4j-community-${NEO4J_VERSION}-unix.tar.gz -C /opt && \
    ln -s /opt/neo4j-community-${NEO4J_VERSION} /opt/neo4j && \
    rm neo4j-community-${NEO4J_VERSION}-unix.tar.gz

ADD conf/* /opt/neo4j/conf/

COPY neo4j-lo-extensions-1.1.jar /opt/neo4j/plugins/

# Chown all
RUN chown lo-daemon. -R /opt/neo4j/ && \
    mkdir -p /opt/neo4j/logs/

# Install services
ADD services /etc/sv

# Expose access to Neo4j HTTP server
EXPOSE 7474

# Expose our data volumes
VOLUME ["/opt/neo4j/data/graph.db"]
