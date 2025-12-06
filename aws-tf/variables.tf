variable "region" {
    type = string
    description = "aws region"
    default = "us-east-1"
}


variable "env" {
    type = string
    description = "Name of environment for which the resource is being created"
    default = "dev"     # dev/qa/stg/prod
}



variable "cidr_range" {
    type = string
    description = "CIDR range for VPC"
    default = "10.10.0.0/16"
}


variable "eks_cluster" {
    type = string
    description = "cluster name for eks"
    default = "demo-eks"
}