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
    private_key = file("/home/cloud/Integrador/llave.pem")
  }

 provisioner "remote-exec" {
  inline = [
    # Actualizar paquetes
    "sudo dnf update -y",

    # Instalar Apache (httpd)
    "sudo dnf install -y httpd",

    # Habilitar y arrancar Apache
    "sudo systemctl enable httpd",
    "sudo systemctl start httpd",

    # Instalar PHP y extensión para MySQL
    "sudo dnf install -y php php-mysqlnd",

    # Instalar cliente MariaDB (compatible con MySQL)
    "sudo dnf install -y mariadb",

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
    private_key = file("/home/cloud/Integrador/llave.pem")
  }

  provisioner "remote-exec" {
  inline = [
    # Actualizar paquetes
    "sudo dnf update -y",

    # Instalar Apache (httpd)
    "sudo dnf install -y httpd",

    # Habilitar y arrancar Apache
    "sudo systemctl enable httpd",
    "sudo systemctl start httpd",

    # Instalar PHP y extensión para MySQL
    "sudo dnf install -y php php-mysqlnd",

    # Instalar cliente MariaDB (compatible con MySQL)
    "sudo dnf install -y mariadb",

    # Reiniciar Apache para cargar PHP
    "sudo systemctl restart httpd"
  ]
}
}