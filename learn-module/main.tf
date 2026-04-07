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

provider "aws" {
  region = "us-east-1"

}


module "vpc" {
  source  = "./local-modules/networking"
  version = "6.1.0"
}



