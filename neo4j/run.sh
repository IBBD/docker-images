#!/bin/bash

docker run \
    --detach \
    --publish=7474:7474 \
    --volume=/data/neo4j:/data \
    --env=NEO4J_CACHE_MEMORY=1G \
    --name=ibbd-neo4j \
    neo4j
