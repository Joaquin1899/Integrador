resource "aws_lb" "webapp_alb" {
  name               = "webapp-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ec2_sg.id] # Grupo de seguridad para el ALB

  subnets = [
    aws_subnet.practico-terraform-subnet1a.id,
    aws_subnet.practico-terraform-subnet1b.id
  ]

  enable_deletion_protection = true


  tags = {
    Name        = "webapp-alb"
    Environment = "production"
  }
}