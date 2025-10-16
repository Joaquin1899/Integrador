resource "aws_vpc" "practico-terraform-vpc" {
  cidr_block           = var.vpc_cidr ##Bloque cidr pasado por variable.
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-practico-integrador"
  }
}

resource "aws_subnet" "practico-terraform-subnet1a" {
  vpc_id                  = aws_vpc.practico-terraform-vpc.id #Asociamos un recurso creado con terraform
  cidr_block              = var.private_subnet1a ## Notar la variable para el cidr block de la subnet
  availability_zone       = var.vpc_aws_az_1a ##Notar la variable para la AZ asignada a la subnet
  map_public_ip_on_launch = "true"
  tags = {
    Name = "test-terraform-subnet1a"
  }
}
resource "aws_subnet" "practico-terraform-subnet1b" {
  vpc_id                  = aws_vpc.practico-terraform-vpc.id #Asociamos un recurso creado con terraform
  cidr_block              = var.private_subnet1b ## Notar la variable para el cidr block de la subnet
  availability_zone       = var.vpc_aws_az_1b ##Notar la variable para la AZ asignada a la subnet
  map_public_ip_on_launch = "true"
  tags = {
    Name = "test-terraform-subnet1b"
  }
}
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.practico-terraform-vpc.id

  tags = {
    Name = "test-terraform-ig"
  }
}