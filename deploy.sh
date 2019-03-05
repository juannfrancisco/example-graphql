#!/bin/bash

#Create Cluster Kubernetes
gcloud container clusters create events-cluster \
--zone us-central1-a \
--num-nodes 2

#Auth kubectl
gcloud container clusters get-credentials events-cluster --zone us-central1-a

cd ~/example-graphql/ms-dal-talks
mvn compile jib:dockerBuild
docker push gcr.io/kubernetes-101-227215/ms-dal-talks:latest

kubectl create -f deploy/deployment.yaml
kubectl create -f deploy/services.yaml


cd ~/example-graphql/ms-dal-speakers
mvn compile jib:dockerBuild
docker push gcr.io/kubernetes-101-227215/ms-dal-speakers:latest
kubectl create -f deploy/deployment.yaml
kubectl create -f deploy/services.yaml


cd ~/example-graphql/ms-api-events
mvn compile jib:dockerBuild
docker push gcr.io/kubernetes-101-227215/ms-dal-speakers:latest
kubectl create -f deploy/configmap.yaml
kubectl create -f deploy/deployment.yaml
kubectl create -f deploy/services.yaml


#Deploy on cloud enpoint
gcloud endpoints services deploy ~/example-graphql/ms-api-events/deploy/openapi.yaml


