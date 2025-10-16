resource "aws_default_route_table" "default_rt" {
  default_route_table_id = aws_vpc.practico-terraform-vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }

  tags = {
    Name = "DefaultRouteTable"
  }
}



resource "aws_route_table" "custom_rt" {
  vpc_id = aws_vpc.practico-terraform-vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }

  tags = {
    Name = "test-terraform-rt"
  }
}

resource "aws_route_table_association" "subnet_assoc_1a" {
    depends_on = [aws_subnet.practico-terraform-subnet1a]
  subnet_id      = aws_subnet.practico-terraform-subnet1a.id
  route_table_id = aws_route_table.custom_rt.id
}

resource "aws_route_table_association" "subnet_assoc_1b" {
    depends_on = [aws_subnet.practico-terraform-subnet1b] 
  subnet_id      = aws_subnet.practico-terraform-subnet1b.id
  route_table_id = aws_route_table.custom_rt.id
}
