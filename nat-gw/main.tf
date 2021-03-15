variable "eip_alloc_id" {}
variable "nat_gw_subnet" {}

resource "aws_nat_gateway" "gw" {
  allocation_id = var.eip_alloc_id
  subnet_id     = var.nat_gw_subnet

  tags = {
    Name = "gpalacio-natgw-training"
    owner = "gpalacio"
    project = "terraform/multiple-region-training"
  }
}