resource "aws_lb" "develop-lb" {
  name               = "develop-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_tls_sg.id]
  subnets            = [aws_subnet.develop_subnet.id]

  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.develop-s3.id
    prefix  = "develop-lb"
    enabled = true
  }

  tags = {
    Environment = "development"
  }
}
