# This is a Udemy course for testing multi-docker containers with kube

## Requirements
* Docker
* Minikube
* Travis
* Google Cloud
* Helm

# Notes

If helm cert manager doesn't work,
helm del --purge cert-manager
helm install --name cert-manager --namespace kube-system --version v0.4.1 stable/cert-manager