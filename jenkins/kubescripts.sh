#!/bin/bash
sudo docker-compose build
sudo docker-compose push


kubectl apply -f kubernetes/rest.yaml
kubectl apply -f kubernetes/angular.yaml
kubectl apply -f kubernetes/nginx.yaml