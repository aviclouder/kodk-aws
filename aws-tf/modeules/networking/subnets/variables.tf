# Common Variables
variable "prefix" {
    type = string
}

variable "vpc_id" {
    type = string  
}

variable "region" {
    type = string
}

# Subnets Variables

variable "vpc_cidr" {
    type = string
}

variable "public_subnet_count" {
    type = number
}

variable "private_subnet_count" {
    type = number
}

data "aws_availability_zones" "available" {}

locals {
    # Splitting VPC CIDR into two: public and private
    public_cird_block = cidrsubnet(var.vpc_cidr, 1, 0)
    private_cidr_block = cidrsubnet(var.vpc_cidr, 1, 1)


    # Calculate number of bits needed to create the required number of subnets
    # Formula: 2^n >= count => ceil(log2(count))
    # public_subnet_bits = ceil(log(var.public_subnet_count) / log(2))
    # private_subnet_bits = ceil(log(var.private_subnet_count) / log(2))
    public_subnet_bits  = ceil(log(var.public_subnet_count, 2))
    private_subnet_bits = ceil(log(var.private_subnet_count, 2))
}

# Route Tables and NAT Gateways Variables

variable "public_route_table_mode" {
    type = string
}