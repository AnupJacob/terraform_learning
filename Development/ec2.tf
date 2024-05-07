resource "aws_instance" "develop_server_instance_1" {
  ami               = var.ec2_ami
  instance_type     = var.ec2_instance_type
  subnet_id         = aws_subnet.develop_subnet_1.id
  availability_zone = var.aws_availability_zone

  tags = {
    Name = "terraform instance for development"
  }
}

resource "aws_instance" "develop_server_instance_2" {
  ami               = var.ec2_ami
  instance_type     = var.ec2_instance_type
  subnet_id         = aws_subnet.develop_subnet_2.id
  availability_zone = var.aws_availability_zone
  security_groups   = [aws_security_group.allow_tls_sg.id]

  tags = {
    Name = "terraform instance for development"
  }
}