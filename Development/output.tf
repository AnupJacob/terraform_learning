output "rds_hostname" {
  description = "RDS instance hostname"
  value       = aws_db_instance.develop-db.address
  sensitive   = true
}

output "rds_port" {
  description = "RDS instance port"
  value       = aws_db_instance.develop-db.port
  sensitive   = true
}

output "rds_username" {
  description = "RDS instance root username"
  value       = aws_db_instance.develop-db.username
  sensitive   = true
}

output "ec2_1_hostname" {
  description = "RDS instance hostname"
  value       = aws_instance.develop_server_instance_1.host_id
  sensitive   = true
}

output "ec2_2_hostname" {
  description = "RDS instance hostname"
  value       = aws_instance.develop_server_instance_2.host_id
  sensitive   = true
}