resource "aws_instance" "develop_server_instance" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type

  tags = {
    Name = "terraform instance for development"
  }
}