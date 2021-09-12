
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
provider "aws" {
  region = "us-east-2"
  access_key = "Your Access Key"
  secret_key = "Your Secret key"
}
