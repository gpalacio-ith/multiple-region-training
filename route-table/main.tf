variable "vpc_id" {}
variable "igw_id" {}
variable public_subnet_id {}

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

# Associates the public route table with the public subnet
resource "aws_route_table_association" "a" {
  subnet_id      = var.public_subnet_id
  route_table_id = aws_route_table.public_rt.id
}