#!/bin/bash
sudo /usr/local/bin/docker-compose build
sudo /usr/local/bin/docker-compose push
### TO DO ###
# Add docker-compose to path

kubectl apply -f kubernetes/rest.yaml
kubectl apply -f kubernetes/angular.yaml
kubectl apply -f kubernetes/nginx.yaml