terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "garage_bucket" {
  bucket = "mkdevops04-access-garage-bucket"

  tags = {
    Environment = "learning"
    ManagedBy   = "terraform"
    Project     = "Access Auto Garage"
    Purpose     = "Infrastructure as Code demonstration"
  }
}

# Block all public access
resource "aws_s3_bucket_public_access_block" "garage_bucket_pab" {
  bucket = aws_s3_bucket.garage_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Enable encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "garage_bucket_sse" {
  bucket = aws_s3_bucket.garage_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Enable versioning
resource "aws_s3_bucket_versioning" "garage_bucket_versioning" {
  bucket = aws_s3_bucket.garage_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}