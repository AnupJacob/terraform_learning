resource "aws_vpc" "develop_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "terraform vpc for development"
  }
}

resource "aws_subnet" "develop_subnet" {
  vpc_id            = aws_vpc.develop_vpc.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.aws_availability_zone

  tags = {
    Name = "terraform subnet for development"
  }
}