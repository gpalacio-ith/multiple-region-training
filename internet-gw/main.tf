variable "vpc_id" {}

# Creates the IGW and attaches it to VPC
resource "aws_internet_gateway" "gw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "gpalacio-igw-training"
    owner = "gpalacio"
    project = "terraform/multiple-region-training"
  }
}

# Exports value for calling module
output "igw_id" {
  value = aws_internet_gateway.gw.id
}