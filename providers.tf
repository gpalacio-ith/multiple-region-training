terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.25"
    }
  }
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
  profile = local.profile_name
}

provider "aws" {
  alias  = "us-east-2"
  region = "us-east-2"
  profile = local.profile_name
}