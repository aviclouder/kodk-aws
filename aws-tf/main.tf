provider "aws" {
    # profile = var.profile
    region = var.region
}

module "vpc" {
    source = "./modules/networking/vpc"
    cidr_block = var.cidr_block

}

module "subnets" {
    source = "./modeules/networking/subnets"
    
}