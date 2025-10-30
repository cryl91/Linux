terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.92.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

#Remote storage of state file in AWS S3
# terraform {
#   backend "s3" {
#     bucket         = "my-terraform-state"  #S3 bucket name
#     key            = "prod/terraform.tfstate"  #path to the state file 
#     region         = "us-west-2"
#     encrypt        = true
#     dynamodb_table = "terraform-lock"  #optional for state locking
#   }
# }
