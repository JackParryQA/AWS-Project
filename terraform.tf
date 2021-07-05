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

}

resource "aws_vpc" "spring_app" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnetA"{
    vpc_id = aws_vpc.spring_app.vpc_id
    cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "privatesubnetA"{
    vpc_id = aws_vpc.spring_app.vpc_id
    cidr_block = "10.0.2.0/24"
}

resource "aws_instance" "nginx" {
    ami           = "ami-005e54dee72cc1d00"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.subnetA.subnet_id
}

resource "aws_instance" "front-end" {
    ami           = "ami-005e54dee72cc1d00"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.subnetA.subnet_id
}

resource "aws_instance" "back-end" {
    ami           = "ami-005e54dee72cc1d00"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.privatesubnetA.subnet_id
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = "mysql-petclinic"
  username             = "petclinic"
  password             = "petclinic"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}



