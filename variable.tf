variable "ami" {
  description = "valor de la ami"
  type        = string
  
}
variable "instance_type" {
  description = "tipo de instancia"
  type        = string
  
}
variable "key_name" {
  description = "valor de la key"
  type        = string
  
}
variable "vpc_id" {
  description = "valor de VPC"
  type        = string
  
}
variable "sg_id" {
  description = "valor de SG"
  type        = string
  
}
variable "vpc_cidr" {
  description = "BLOQUE CIDR"
  type        = string
  
}
variable "vpc_aws_az_1a" {
  description = "zona"
  type        = string
  
}
variable "vpc_aws_az_1b" {
  description = "zona"
  type        = string
  
}
variable "private_subnet1a" {
  description = " bloque subred"
  type        = string
  
}
variable "private_subnet1b" {
  description = " bloque subred"
  type        = string
  
}