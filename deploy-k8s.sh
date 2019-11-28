#!/bin/bash

#Set project id
PROJECT_ID=k8s-example-257801

sed -i '' -e 's/PROJECT_ID/'"$PROJECT_ID"'/g' ms-dal-talks/deploy/deployment.yaml
sed -i '' -e 's/PROJECT_ID/'"$PROJECT_ID"'/g' ms-dal-speakers/deploy/deployment.yaml
sed -i '' -e 's/PROJECT_ID/'"$PROJECT_ID"'/g' ms-api-events/deploy/deployment.yaml



#Deploy on cloud enpoint
#gcloud endpoints services deploy ~/example-graphql/ms-api-events/deploy/openapi.yaml



kubectl apply -f ms-dal-talks/deploy/deployment.yaml
kubectl apply -f ms-dal-talks/deploy/services.yaml

kubectl apply -f ms-dal-speakers/deploy/deployment.yaml
kubectl apply -f ms-dal-speakers/deploy/services.yaml


kubectl apply -f ms-api-events/deploy/configmap.yaml
kubectl apply -f ms-api-events/deploy/deployment.yaml
kubectl apply -f ms-api-events/deploy/services.yaml

#Deploy on cloud enpoint
#gcloud endpoints services deploy ~/example-graphql/ms-api-events/deploy/openapi.yaml

