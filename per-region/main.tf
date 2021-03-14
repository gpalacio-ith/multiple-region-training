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

# Creates IGW and attach it to the VPC
module "internet-gw" {
  source = "../internet-gw"
  vpc_id = module.vpc.vpc_id
}

# Creates public routing table (not main)
module "route-table" {
  source = "../route-table"
  vpc_id = module.vpc.vpc_id
  igw_id = module.internet-gw.igw_id
  public_subnet_id = module.subnet.public_subnet_id
}

# Exports VPC ID value to be used by calling module
output "vpc_id" {
  value = module.vpc.vpc_id
}