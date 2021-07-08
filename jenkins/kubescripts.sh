#!/bin/bash
sudo docker-compose build
sudo docker-compose push
### TO DO ###
# Add docker-compose to path

kubectl apply -f kubernetes/rest.yaml
kubectl apply -f kubernetes/angular.yaml
kubectl apply -f kubernetes/nginx.yaml