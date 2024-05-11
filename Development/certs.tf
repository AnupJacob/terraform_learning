resource "tls_private_key" "tls_project_key" {
  algorithm = "RSA"
}

resource "tls_self_signed_cert" "tls_project_cert" {
  #  key_algorithm   = "RSA"
  private_key_pem = tls_private_key.tls_project_key.private_key_pem

  subject {
    common_name  = "personal_project.com"
    organization = "Personal Project"
  }

  validity_period_hours = 12

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}

resource "aws_acm_certificate" "project_cert" {
  private_key      = tls_private_key.tls_project_key.private_key_pem
  certificate_body = tls_self_signed_cert.tls_project_cert.cert_pem
}