terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.47.0"
    }
  }
}

provider "aws" {
  region = var.AWS-REGION

#  access_key = var.AWS_ACCESS_KEY
#  secret_key = var.AWS_SECRET_KEY
}

resource "aws_instance" "personal_test" {
  ami           = "ami-0d421d84814b7d51c"
  instance_type = "t2.micro"

  tags = {
    Name = "test"
  }
}
