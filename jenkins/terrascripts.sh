#!/bin/bash
cd terra
terraform destroy -auto-approve
terraform init
terraform plan -out plan.out -no-color
terraform apply plan.out -no-color