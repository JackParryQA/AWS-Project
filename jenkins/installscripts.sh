#!/bin/bash
sudo yum update -y

sudo amazon-linux-extras install docker -y
sudo service docker start

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


sudo docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

curl -sL https://rpm.nodesource.com/setup_14.x | sudo -E bash - 
sudo yum install -y nodejs 

#KubeCTL
#curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
#curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
#echo "$(<kubectl.sha256) kubectl" | sha256sum --check

#KubeCTL
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.20.4/2021-04-12/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
kubectl version --short --client

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
wget https://releases.hashicorp.com/terraform/0.14.6/terraform_0.14.6_linux_amd64.zip
unzip terraform_*_linux_*.zip
sudo mv terraform /usr/local/bin

## Check if terraform working properly
terraform --version

aws configure
$ACCESS_KEY
$SECRET_KEY
eu-west-2
json