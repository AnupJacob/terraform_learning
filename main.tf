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

resource "aws_route_table" "route_table_1" {
  vpc_id = aws_vpc.test_vpc1.id

  route = []

  tags = {
    Name = "example"
  }
}

resource "aws_route_table" "route_table_2" {
  vpc_id = aws_vpc.test_vpc2.id

  route = []

  tags = {
    Name = "example"
  }
}

resource "aws_route_table_association" "route_table_association_1" {
  route_table_id = aws_route_table.route_table_1.id
  gateway_id = aws_internet_gateway.internet_gateway_1.id
}

resource "aws_route_table_association" "route_table_association_2" {
  route_table_id = aws_route_table.route_table_2.id
  gateway_id = aws_internet_gateway.internet_gateway_2.id
}

resource "aws_internet_gateway" "internet_gateway_1" {
  vpc_id = "${aws_vpc.test_vpc1.id}"
  depends_on = [aws_vpc.test_vpc1]
}

resource "aws_internet_gateway" "internet_gateway_2" {
  vpc_id = "${aws_vpc.test_vpc2.id}"
  depends_on = [aws_vpc.test_vpc2]
}

resource "aws_budgets_budget" "budget-limit" {
  name              = "budget-limit"
  budget_type       = "COST"
  limit_amount      = "1"
  limit_unit        = "USD"
  time_period_end   = "2050-06-15_00:00"
  time_period_start = "2024-04-03_00:00"
  time_unit         = "DAILY"


  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 40
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = ["anup.jacob@outlook.com"]
  }
}
