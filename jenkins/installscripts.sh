#!/bin/bash
sudo apt-get update
sudo apt install curl -y
curl https://get.docker.com | sudo bash

# sudo amazon-linux-extras install docker -y
# sudo service docker start
sudo usermod -aG docker $(whoami)

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


sudo docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

curl -sL https://rpm.nodesource.com/setup_14.x | sudo -E bash - 
sudo apt install -y nodejs 

#KubeCTL
#curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
#curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
#echo "$(<kubectl.sha256) kubectl" | sha256sum --check

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

#KubeCTL
# curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.20.4/2021-04-12/bin/linux/amd64/kubectl
# chmod +x ./kubectl
# mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
# kubectl version --short --client

# Terraform installation ##
############################
## Get terraform package
# TERRAFORM_VER=`curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest |  grep tag_name | cut -d: -f2 | tr -d \"\,\v | awk '{$1=$1};1'`
# wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/terraform_${TERRAFORM_VER}_linux_amd64.zip
 
# ## Unzip the package
# unzip terraform_${TERRAFORM_VER}_linux_amd64.zip

# ## Move the package to /usr/local/bin
# sudo mv terraform /usr/local/bin/ && rm terraform_${TERRAFORM_VER}_linux_amd64.zip 

sudo apt install -y unzip wget
rm terraform_*_linux_*.zip
wget https://releases.hashicorp.com/terraform/1.0.1/terraform_1.0.1_linux_amd64.zip
unzip terraform_*_linux_*.zip
sudo mv terraform /usr/local/bin

## Check if terraform working properly
terraform --version

aws configure set aws_access_key_id "$ACCESS_KEY"
aws configure set aws_secret_access_key "$SECRET_KEY"
aws configure set region "eu-west-2"
aws configure set output "json"