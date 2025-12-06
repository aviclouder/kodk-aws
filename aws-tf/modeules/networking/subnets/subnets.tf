# Public Subnets
resource "aws_subnet" "public-subnets" {
    vpc_id = var.vpc_id

    count = var.public_subnet_count
    cidr_block = cidrsubnet(local.public_cird_block, local.public_subnet_bits, count.index)
    availability_zone = element(data.aws_availability_zones.available.names, count.index)
    map_public_ip_on_launch = true

    tags = {
        Name = "public-${substr(element(data.aws_availability_zone.available.names, count.index), -1, 1)}"
    }

}


# Private Subnets
resource "aws_subnet" "private-subnets" {
    vpc_id = var.vpc_id

    count = var.private_subnet_count
    cidr_block = cidrsubnet(local.private_cidr_block, local.private_subnet_bits, count.index)
    availability_zone = element(data.aws_availability_zones.available.names, count.index)
    map_public_ip_on_launch = false

    tags = {
        Name = "private-${substr(element(data.aws_availability_zone.available.names, count.index), -1, 1)}"
    }

}