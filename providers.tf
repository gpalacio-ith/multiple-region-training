terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.25"
    }
  }
}

provider "aws" {
  alias  = "us-west-1"
  region = "us-west-1"
  profile = local.profile_name
}

provider "aws" {
  alias  = "us-west-2"
  region = "us-west-2"
  profile = local.profile_name
}