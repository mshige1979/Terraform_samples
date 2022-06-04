###############################################################################
# Route Table
###############################################################################
# Route Table(public)
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.prefix}-public-rt"
  }
}

# サブネット紐付け(1a)
resource "aws_route_table_association" "public_subnet_1a_rt_assoc" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.public_rt.id
}

# サブネット紐付け(1c)
resource "aws_route_table_association" "public_subnet_1c_rt_assoc" {
  subnet_id      = aws_subnet.public_subnet_1c.id
  route_table_id = aws_route_table.public_rt.id
}

# Route Table(private)
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.prefix}-private-rt"
  }
}

# サブネット紐付け(1a)
resource "aws_route_table_association" "private_subnet_1a_rt_assoc" {
  subnet_id      = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.private_rt.id
}

# サブネット紐付け(1c)
resource "aws_route_table_association" "private_subnet_1c_rt_assoc" {
  subnet_id      = aws_subnet.private_subnet_1c.id
  route_table_id = aws_route_table.private_rt.id
}
