resource "aws_s3_bucket" "develop-s3" {
  bucket = "develop-s3"

  tags = {
    Name        = "development s3"
    Environment = "development"
  }
}