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
# and attaches it to IGW
module "route-table" {
  source = "../route-table"
  vpc_id = module.vpc.vpc_id
  igw_id = module.internet-gw.igw_id
  public_subnet_id = module.subnet.public_subnet_id
}

# Creates EIP to be used by NAT-GW
module "eip" {
  source = "../elastic-ip"
}

# Creates NAT-GW to be used by private routing tables
module "nat-gw" {
  source = "../nat-gw"
  eip_alloc_id = module.eip.eip_id
  nat_gw_subnet = module.subnet.private_subnet_id_1
}

# Creates one EC2 in each private subnets
module "instance" {
  source = "../instance"
  private_subnets = {
    1: module.subnet.private_subnet_id_1,
    2: module.subnet.private_subnet_id_2
  }
  custom_sg_id = module.security-group.sg_id
}

# Creates one security group with custom rules
module "security-group" {
  source = "../sec-group"
  vpc_id = module.vpc.vpc_id
}

# Exports VPC ID value to be used by calling module
output "vpc_id" {
  value = module.vpc.vpc_id
}