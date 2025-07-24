terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.92.0"
    }
  }

#   #Before locking the file, create a s3 bucket and dynamodb table in aws
#This block of code is part of a Terraform backend configuration that tells Terraform where to store its state file remotely — 
#in this case, in Amazon S3 — and how to lock it to avoid concurrent updates using DynamoDB.

#   backend "s3" {
#     bucket = "terraform-bucket-cyril"
#     key    = "foreach-demo" #Acts like a filename (or path) for the state file inside the bucket. 
#     region = "us-east-1"
#     dynamodb_table = "cyril-lock" #This is used for state locking. Terraform uses this DynamoDB table to prevent multiple users or processes from applying changes at the same time.
# }

}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

#To keep state file in remote s3 bucket and lock with dynamo db
 
  
