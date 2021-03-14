terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "= 3.25.0"
    }
  }
}

provider "aws" {
  alias  = "us-west-1"
  region = "us-west-1"
}

provider "aws" {
  alias  = "us-west-2"
  region = "us-west-2"
}