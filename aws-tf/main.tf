provider "aws" {
  region = var.region
}


module "vpc" {
  source = "./modeules/networking/vpc"
  prefix = var.prefix
  env = var.env
  cidr_block = var.vpc_cidr
}


module "subnets" {
  source = "./modeules/networking/subnets"
  vpc_cidr = var.vpc_cidr

  vpc_id =  module.vpc.vpc_id
  prefix = var.prefix
  region = var.region
  public_subnet_count = var.public_subnet_count
  private_subnet_count = var.private_route_table_mode
  public_route_table_mode = var.public_route_table_mode
}