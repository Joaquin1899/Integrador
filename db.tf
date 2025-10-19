resource "aws_db_instance" "default" {
  allocated_storage       = 10
  engine                  = "mysql"
  engine_version          = "5.7"
  instance_class          = "db.t3.micro"
  username                = "admin"
  password                = "luis1234"
  db_subnet_group_name    = aws_db_subnet_group.gruposubnet.name
  skip_final_snapshot     = true
}

resource "aws_db_subnet_group" "gruposubnet" {
  name       = "grupodesubredes"
  subnet_ids = [
    aws_subnet.practico-terraform-subnet1a.id,
    aws_subnet.practico-terraform-subnet1b.id
  ]

  tags = {
    Name = "My DB subnet group"
  }
}
