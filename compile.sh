#!/bin/bash

# TODO: Setear variable con el path actual e incluirlo en cada cd 
git submodule update --init --recursive

cd ~/example-graphql/ms-dal-talks
mvn compile jib:build -Dimage=gcr.io/${PROJECT_ID}/ms-dal-talks:latest

kubectl create -f ~/example-graphql/ms-dal-talks/deploy/deployment.yaml
kubectl create -f ~/example-graphql/ms-dal-talks/deploy/services.yaml


cd ~/example-graphql/ms-dal-speakers
mvn compile jib:build -Dimage=gcr.io/${PROJECT_ID}/ms-dal-speakers:latest

kubectl create -f ~/example-graphql/ms-dal-speakers/deploy/deployment.yaml
kubectl create -f ~/example-graphql/ms-dal-speakers/deploy/services.yaml


cd ~/example-graphql/ms-api-events
mvn compile jib:build -Dimage=gcr.io/${PROJECT_ID}/ms-api-events:latest

kubectl create -f ~/example-graphql/ms-api-events/deploy/configmap.yaml
kubectl create -f ~/example-graphql/ms-api-events/deploy/deployment.yaml
kubectl create -f ~/example-graphql/ms-api-events/deploy/services.yaml


#Deploy on cloud enpoint
gcloud endpoints services deploy ~/example-graphql/ms-api-events/deploy/openapi.yaml


