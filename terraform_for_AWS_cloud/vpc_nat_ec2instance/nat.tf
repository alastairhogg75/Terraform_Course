# Define External IP
resource "aws_eip" "levelup-nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "levelup-nat-gw" {
  allocation_id = aws_eip.levelup-nat.id
  subnet_id = aws_subnet.levelup_vpc-public-1.id
  depends_on = [aws_internet_gateway.levelup_gw]
}

resource "aws_route_table" "levelup-private" {
  vpc_id = aws_vpc.levelup_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.levelup-nat-gw.id
  }

  tags = {
    Name = "levelup-private"
  }
}

# Route Associations Private
resource "aws_route_table_association" "level-private-1-a" {
  subnet_id = aws_subnet.levelup_vpc-private-1.id
  route_table_id = aws_route_table.levelup-private.id
}

resource "aws_route_table_association" "level-private-1-b" {
  subnet_id = aws_subnet.levelup_vpc-private-2.id
  route_table_id = aws_route_table.levelup-private.id
}

resource "aws_route_table_association" "level-private-1-c" {
  subnet_id = aws_subnet.levelup_vpc-private-3.id
  route_table_id = aws_route_table.levelup-private.id
}
