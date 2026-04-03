provider "aws" {
  region = var.region
}

provider "aws" {
  region = "us-west-1"
  alias  = "us-west-1"
}

terraform {
  backend "local" {

  }
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# this is an example of a local variable it can be accessed by using local.<variable_name>
locals {
  tags = {
    "asdk:development" = "development"
  }
  project_owner = "ranjan"
  cost_center   = "12345"
}



resource "aws_s3_bucket" "my_bucket_in_us_east_1" {
  bucket = "my-unique-bucket-name-12345"
  tags = merge(local.tags, {
    "asdk:project_owner" = local.project_owner,
    "asdk:cost_center"   = local.cost_center
  })
}

resource "aws_s3_bucket" "my_bucket_in_us_west_1" {
  provider = aws.us-west-1
  bucket   = "my-unique-bucket-name-67890"
  tags     = local.tags

}


