terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.47.0"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "test_server_instance" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type

  tags = {
    Name = "terraform test instance"
  }
}

resource "aws_vpc" "test_vpc1" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "terraform test vpc 1"
  }
}

resource "aws_subnet" "test_subnet1" {
  vpc_id     = aws_vpc.test_vpc1.id
  cidr_block = var.subnet_cidr

  tags = {
    Name = "terraform test subnet 1"
  }
}

resource "aws_vpc" "test_vpc2" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "terraform test vpc 2"
  }
}

resource "aws_subnet" "test_subnet2" {
  vpc_id     = aws_vpc.test_vpc2.id
  cidr_block = var.subnet_cidr

  tags = {
    Name = "terraform test subnet 2"
  }
}
