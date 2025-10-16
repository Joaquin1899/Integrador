provider "aws" {
  region  = "us-east-1"
}
resource "aws_instance" "nombre-resource" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id = aws_subnet.practico-terraform-subnet1a.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  tags = {
    Name      = "ec2-instance-web01"
  }
 connection {
    type     = "ssh"
    user     = "ec2-user"
    host     = self.public_ip
    private_key = file("/home/cloud/PracticoIntegrador/llave.pem")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",

      # Activar repositorio PHP 5.6
      "sudo amazon-linux-extras enable php5.6",
      "sudo yum clean metadata",
      "sudo yum install -y php php-mysql",

      # Instalar cliente MySQL
      "sudo yum install -y mysql",

      # Reiniciar Apache para cargar PHP
      "sudo systemctl restart httpd"
    ]
  }
}
resource "aws_instance" "nombre-resource1" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id = aws_subnet.practico-terraform-subnet1b.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  tags = {
    Name      = "ec2-instance-web02"
  }
 connection {
    type     = "ssh"
    user     = "ec2-user"
    host     = self.public_ip
    private_key = file("/home/cloud/PracticoIntegrador/llave.pem")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",

      # Activar repositorio PHP 5.6
      "sudo amazon-linux-extras enable php5.6",
      "sudo yum clean metadata",
      "sudo yum install -y php php-mysql",

      # Instalar cliente MySQL
      "sudo yum install -y mysql",

      # Reiniciar Apache para cargar PHP
      "sudo systemctl restart httpd"
    ]
  }
}