variable "vpc_id" {
    type = string
}

variable "igw_id" {
    type = string
}

variable "region" {
    type = string
}

variable "nat_gateway_id" {
    type = string
}

variable "public_subnet_count" {
    type = number
}

variable "private_subnet_count" {
    type = number
}

variable "public_route_table_mode" {
    type = string
}

variable "private_route_table_mode" {
    type = string
}

