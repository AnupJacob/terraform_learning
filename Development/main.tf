terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.47.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

check "certificate" {
  assert {
    condition     = aws_acm_certificate.project_cert.status == "ERRORED"
    error_message = "Certificate status is ${aws_acm_certificate.project_cert.status}"
  }
}

check "health_check" {
  assert {
    condition     = data.http.terraform_io.status_code == 200
    error_message = "${data.http.terraform_io.url} returned an unhealthy status code"
  }
}


data "http" "terraform_io" {
  url = "https://www.terraform.io"
}
