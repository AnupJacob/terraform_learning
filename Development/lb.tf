resource "aws_lb" "develop_lb" {
  name               = "develop-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_tls_sg.id]
  subnets            = [aws_subnet.develop_subnet_1.id, aws_subnet.develop_subnet_2.id]

  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.develop_s3.id
    prefix  = "develop-lb"
    enabled = true
  }

  tags = {
    Environment = "development"
  }
}
