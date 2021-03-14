locals {
  public_subnet = element(cidrsubnets(var.vpc_cidr,4,4,4), 0)
  private_subnet_1 = element(cidrsubnets(var.vpc_cidr,4,4,4), 1)
  private_subnet_2 = element(cidrsubnets(var.vpc_cidr,4,4,4), 2)
}