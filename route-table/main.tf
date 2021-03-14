variable "vpc_id" {}
variable "igw_id" {}

# Creates the routing table, with default route to IGW
resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id

  # Adds default route
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = local.common_tags_public
}