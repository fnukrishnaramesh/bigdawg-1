#!/bin/bash

# This script produces baseline images with the Middleware but no data
# Login to Dockerhub repository first ("docker login <username>") so that "docker push" works
#
# Remove all images: docker rmi -f $(docker images -a -q)
# Remove all containers: docker rm $(docker ps -a -q)

echo
echo "========================================"
echo "===== Packaging the Middleware jar ====="
echo "========================================"

mvn package -P mit -DskipTests -f ../pom.xml

echo
echo "==================================================="
echo "===== Copying artifacts to docker directories ====="
echo "==================================================="

cp ../target/istc.bigdawg-1.0-SNAPSHOT-jar-with-dependencies.jar postgres
cp ../target/istc.bigdawg-1.0-SNAPSHOT-jar-with-dependencies.jar scidb
cp ../target/istc.bigdawg-1.0-SNAPSHOT-jar-with-dependencies.jar accumulo
chmod +r postgres/istc.bigdawg-1.0-SNAPSHOT-jar-with-dependencies.jar
chmod +r scidb/istc.bigdawg-1.0-SNAPSHOT-jar-with-dependencies.jar
chmod +r accumulo/istc.bigdawg-1.0-SNAPSHOT-jar-with-dependencies.jar
cp ../src/main/resources/PostgresParserTerms.csv postgres
cp ../src/main/resources/PostgresParserTerms.csv scidb
cp ../src/main/resources/PostgresParserTerms.csv accumulo
cp ../src/main/resources/SciDBParserTerms.csv postgres
cp ../src/main/resources/SciDBParserTerms.csv scidb
cp ../src/main/resources/SciDBParserTerms.csv accumulo

echo
echo "===================================================="
echo "===== Building images and pushing to dockerhub ====="
echo "===================================================="

echo "==> postgres"
docker build --rm -t welllogs/postgres postgres/

echo "==> scidb"
docker build --rm -t welllogs/scidb scidb/

echo "==> accumulo"
docker build --rm -t welllogs/accumulo-base docker-builds/accumulo/
docker build --rm -t welllogs/accumulo accumulo/

echo "==> pushing images to dockerhub"
docker push welllogs/postgres
docker push welllogs/scidb
docker push welllogs/accumulo-base
docker push welllogs/accumulo

echo
echo "================="
echo "===== Done. ====="
echo "================="
