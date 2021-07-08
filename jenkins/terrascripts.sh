#!/bin/bash
cd terra
terraform init
terraform destroy -auto-approve
#
terraform plan -out plan.out -no-color
terraform apply plan.out -no-color