#!/bin/bash
cd terra
terraform init
terraform plan
terraform apply -y