terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>6.10"

    }
  }

  # backend "s3" {
  #   bucket = ""           # Bucket name
  #   key = "terraform.tfstate"
  #   dynamodb_table = ""   # DynamoDB table name
  #   region = ""           # Region name
  # }
}