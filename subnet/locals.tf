# Splits the VPC CIDR block into subntes with netmask 4 bits longer
locals {
  public_subnet = element(cidrsubnets(var.vpc_cidr,4,4,4), 0)
  private_subnet_1 = element(cidrsubnets(var.vpc_cidr,4,4,4), 1)
  private_subnet_2 = element(cidrsubnets(var.vpc_cidr,4,4,4), 2)
}

locals {
  common_tags_private = {
    Name = "gpalacio-private-subnet-training"
    owner = "gpalacio"
    project = "terraform/multiple-region-training"
  }

  common_tags_public = {
    Name = "gpalacio-public-subnet-training"
    owner = "gpalacio"
    project = "terraform/multiple-region-training"
  }
}