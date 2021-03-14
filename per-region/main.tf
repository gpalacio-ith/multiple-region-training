data "aws_region" "current" {}

variable "cidr" {}

# Creates the VPC
module "vpc" {
  source = "../vpc"
  cidr = var.cidr[data.aws_region.current.name]
}

# Creates public/private subnets within VPC
module "subnet" {
  source = "../subnet"
  vpc_id = module.vpc.vpc_id
  vpc_cidr = var.cidr[data.aws_region.current.name]
}

# Exports VPC ID value to be used by calling module
output "vpc_id" {
  value = module.vpc.vpc_id
}