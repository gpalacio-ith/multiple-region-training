data "aws_region" "current" {}

variable "cidr" {}

module "vpc" {
  source = "../vpc"
  cidr = var.cidr[data.aws_region.current.name]
}

module "subnet" {
  source = "../subnet"
  vpc_id = module.vpc.vpc_id
  vpc_cidr = var.cidr[data.aws_region.current.name]
}


output "vpc_id" {
  value = module.vpc.vpc_id
}