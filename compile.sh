#!/bin/bash

#Set project id
PROJECT_ID=k8s-example-257801
PWD=$(pwd)
echo "==============================="
echo "Crando docker image Talks"
echo "==============================="
cd $PWD/ms-dal-talks
mvn compile jib:build -Dimage=gcr.io/$PROJECT_ID/ms-dal-talks:latest

echo "==============================="
echo "Crando docker image speakers"
echo "==============================="
cd ../ms-dal-speakers
mvn compile jib:build -Dimage=gcr.io/$PROJECT_ID/ms-dal-speakers:latest

echo "==============================="
echo "Crando docker image events"
echo "==============================="
cd ../ms-api-events
mvn compile jib:build -Dimage=gcr.io/$PROJECT_ID/ms-api-events:latest

