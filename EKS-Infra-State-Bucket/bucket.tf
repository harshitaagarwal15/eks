terraform {
  backend "s3" {
    bucket = "test-c360-dev-terraform"
    key    = "s3/terraform.tfstate"
    region = "us-west-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

# Create S3 bucket to hold the terraform state files
resource "aws_s3_bucket" "terraform_state" {
  bucket = "test-c360-dev-terraform"

  tags = {
    Category    = "360_Core"
    SubCategory = "Innovation"
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_state_block_access" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_encrypt" {
  bucket = aws_s3_bucket.terraform_state.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
    }
  }
}