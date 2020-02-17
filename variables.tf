/*
# remote configuration
terraform {
  required_version = ">= 0.11.1"

  backend "s3" {
    encrypt = "true"
  }
}
*/ 

# aws provider
provider "aws" {
  secret_key = var.AWS_SECRET_KEY
  access_key = var.AWS_ACCESS_KEY
  region = "eu-west-1"
}
  
# fetching coreos AMI
data "aws_ami" "coreos" {
  filter {
    name   = "name"
    values = ["CoreOS-stable-1576.4.0-hvm"] # Fixed value to avoid recreation of instances
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["595879546273"] # CoreOS
}

# path to ssh public key
variable "public_key_path" {
  default = "mykey.pub"
}

# name of the key to be used
variable "key_name" {
  default = "mykey"
}

# name of the key to be used
variable "instance_name" {
  default = "ec2-user"
}

# EC2 machine instance type 
variable "instance_type" {
  default = "t2.micro"
}

variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

