resource "aws_security_group" "postgres_sg" {
  name        = "postgres_sg"
  description = "Allow all ingress traffic through 5432"
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "postgres" {
   name = "postgres"
   username= "master"
   password = "password"
   engine = "postgres"
   engine_version = "9.5.10"
   instance_class = "db.t2.micro"
   license_model = "postgresql-license"
   allocated_storage = 10
   vpc_security_group_ids = ["${aws_security_group.postgres_sg.id}"]
   tags {
    Name = "postgres_db_naresh"
  }
}
