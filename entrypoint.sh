#!/bin/sh

echo "input username: $INPUT_USERNAME"
echo "input tag: $INPUT_TAG"
echo $(pwd)/$INPUT_INITIALIZERPATH
docker run --name neo4j -d -p 7687:7687 -p 7474:7474 -e NEO4J_AUTH=$INPUT_USERNAME/$INPUT_PASSWORD -e NEO4JLABS_PLUGINS="[\"apoc\"]" -v $(pwd)/$INPUT_INITIALIZERPATH:/var/lib/neo4j/import/initializer.cypher:ro -v /apoc.conf:/var/lib/neo4j/conf/apoc.conf:ro neo4j:$INPUT_TAG
