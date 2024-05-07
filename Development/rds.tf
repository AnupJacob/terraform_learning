resource "aws_db_instance" "develop-db" {
  allocated_storage    = 5
  db_name              = "development-db"
  engine               = "postgres"
  engine_version       = "14.1"
  instance_class       = "db.t3.micro"
  parameter_group_name = aws_db_parameter_group.develop_db_parameter.name
  skip_final_snapshot  = true
}

resource "aws_db_parameter_group" "develop_db_parameter" {
  name   = "develop-db-parameter-group"
  family = "postgres14"
}