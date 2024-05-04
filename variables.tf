variable "aws_region" {
  description = "Region for terraform configuration"
  default     = "eu-west-1"
}

variable "aws_availability_zone" {
  description = "Availability zone for terraform configuration"
  default     = "eu-west-1a"
}

variable "ec2_instance_type" {
  description = "EC2 INSTANCE TYPE"
  default     = "t2.micro"
}

variable "ec2_ami" {
  description = "EC2 default AMI configuration"
  default     = "ami-0d421d84814b7d51c"
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR for subnet"
  default     = "10.0.1.0/24"
}