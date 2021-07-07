#!/bin/bash
cd terra
terraform destroy
terraform init
terraform plan -out plan.out -no-color
terraform apply plan.out -no-color