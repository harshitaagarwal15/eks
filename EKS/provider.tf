terraform {
  required_version = "= 1.3.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket  = "test-c360-dev-terraform"
    key     = "eks/terraform.tfstate"
    encrypt = true
    region  = "us-west-2"
    profile = "default"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
  profile = "default"
}
