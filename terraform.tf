terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-2"
  access_key = "AKIAVAR2U44IOTYVB22C"
  secret_key = "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"
}

resource "aws_vpc" "spring_app" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnetA"{
    vpc_id = aws_vpc.spring_app.vpc_id
    cidr_block = "10.0.1.0/24"
}

resource "aws_ec2"


