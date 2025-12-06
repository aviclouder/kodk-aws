variable "region" {
    type = string
    description = "AWS default region"
}

variable "prefix" {
    type = "string"
    description = "Value that should be used in prefix of the service name"
}

variable "use_default_vpc" {
    type = bool
    description = "Check if you want to use default VPC or not"
    default = false  
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
    type = string
    description = "CIDR block for AWS VPC"
}

variable "public_subnet_count" {
  description = "Number of public subnets to create"
  type        = number
  default     = 3
}

variable "private_subnet_count" {
  description = "Number of private subnets to create"
  type        = number
  default     = 3
}


variable "k8s_cluster_name" {
    default = "k8s"
    type = string
    description = "Kubernetes Cluster Name"   
}


variable "public_route_table_mode" {
  description = "Route table mode: shared or dedicated"
  type        = string
  default     = "shared"  # options: shared or dedicated
}


variable "private_route_table_mode" {
  description = "Route table mode for private subnets: shared or dedicated"
  type        = string
  default     = "shared"  # options: shared or dedicated
}


variable "env" {
    type = string
    description = "Environment for AWS Infra. Select from: DEV, STG, PROD or keep it blank(using double quotes)"
}

variable "nat_gateway_mode" {
  description = "single or per_az"
  type        = string
  default     = "single"
}
