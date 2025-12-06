
resource "aws_vpc" "vpc" {
    cidr_block = var.cidr_block
    enable_dns_support = "true"
    enable_dns_hostnames = "true"

    instance_tenancy = "default"

    tags = {
      NAME = "${var.prefix}-vpc"
      ENV = "${var.env}"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id

    tags = {
      NAME = "${var.prefix}-igw"
      ENV = "${var.env}"
    }
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "${var.prefix}-nat-eip"
  }

  depends_on = [ aws_internet_gateway.igw ]
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat_eip
  
  subnet_id = ""

  depends_on = [ aws_internet_gateway.igw ]
}