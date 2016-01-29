# Docker Common
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://tldrlegal.com/license/mit-license#summary)

LivingObjects base images

## Images

    #base:3.3
    #-> java8jre:jre8u71 FROM base:3.3
    #--> java8_collector_tools:jre8u71 FROM java8jre:jre8u71
    #--> longback-daemon:1_2 FROM java8jre:jre8u71
    #--> neo4j:2.3.2_0 FROM java8jre:jre8u71
    #-> nginx:1.8.0_2 FROM base:3.3
    #-> rsync:1.5 FROM base:3.3
    #mysql:5.6_7

