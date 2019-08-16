#Create Cluster Kubernetes
gcloud container clusters create events-cluster \
--zone us-central1-a \
--num-nodes 2

#Auth kubectl
gcloud container clusters get-credentials events-cluster --zone us-central1-a