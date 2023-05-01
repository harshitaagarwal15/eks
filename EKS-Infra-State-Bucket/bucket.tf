resource "aws_s3_bucket" "terraform_state" {
  bucket = "eks-cluster-remote-state"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "eks-cluster-remote-state"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.terraform_state.bucket

  rule {
    apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "security" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

