resource "aws_instance" "develop_server_instance" {
  ami               = var.ec2_ami
  instance_type     = var.ec2_instance_type
  subnet_id         = aws_subnet.develop_subnet.id
  availability_zone = var.aws_availability_zone

  tags = {
    Name = "terraform instance for development"
  }
}