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