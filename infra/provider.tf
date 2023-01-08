provider "aws" {   ###
  region = var.region
  default_tags {
    tags = {
      App = var.app
      Env = var.env
    }
  }
}


terraform {
  required_version = "1.3.6"

   backend "s3" {} 

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.41.0"
    }
  }
}