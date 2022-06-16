# このへんはおまじないらしい
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
  # stateをS3で管理
  backend "s3" {
    bucket = "mshige1979-terraform"
    region = "ap-northeast-1"
    key = "01/terraform.tfstate"
    encrypt = true
  }
}

# AWS
provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# VPC
resource "aws_vpc" "vpc1" {
  cidr_block           = "10.1.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "false"
  tags = {
    Name = "${var.prefix}-vpc1"
  }
}
