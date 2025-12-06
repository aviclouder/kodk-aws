# Route table for public subnets (shared or dedicated)
resource "aws_route_table" "public" {
  count  = var.public_route_table_mode == "dedicated" ? var.public_subnet_count : 1

  vpc_id = var.vpc_id

  tags = {
    Name = var.public_route_table_mode == "dedicated" ? "public-rt-${count.index}" : "public-rt"
  }
}

# Associate route table with subnet(s)
resource "aws_route_table_association" "public_assoc" {
  count = var.public_subnet_count

  subnet_id      = aws_subnet.public-subnets[count.index].id
  route_table_id = var.public_route_table_mode == "dedicated" ? aws_route_table.public[count.index].id : aws_route_table.public[0].id
}

# Add route to IGW (only needed once, even for dedicated)
resource "aws_route" "public_default_route" {
  count = var.public_route_table_mode == "dedicated" ? var.public_subnet_count : 1

  route_table_id         = aws_route_table.public[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw_id
}


# Route table for private subnets (shared or dedicated)
resource "aws_route_table" "private" {
  count  = var.private_route_table_mode == "dedicated" ? var.private_subnet_count : 1

  vpc_id = var.vpc_id

  tags = {
    Name = var.private_route_table_mode == "dedicated" ? "private-rt-${count.index}" : "private-rt"
  }
}

# Associate route table with subnet(s)
resource "aws_route_table_association" "private_assoc" {
  count = var.private_subnet_count

  subnet_id      = aws_subnet.private-subnets[count.index].id
  route_table_id = var.private_route_table_mode == "dedicated" ? aws_route_table.private[count.index].id : aws_route_table.private[0].id
}

# Private route to NAT Gateway (if used)
resource "aws_route" "private_default_route" {
  count = var.private_route_table_mode == "dedicated" ? var.private_subnet_count : 1

  route_table_id         = aws_route_table.private[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nat_gateway_id
}
