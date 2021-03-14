variable "vpc_id" {}
variable "vpc_cidr" {}

# Creates public subnets for VPC
resource "aws_subnet" "public_subnet" {
  vpc_id = var.vpc_id
  cidr_block = local.public_subnet
  tags = local.common_tags_public
}

# Creates privates subnets for VPC
resource "aws_subnet" "private_subnet_1" {
  vpc_id = var.vpc_id
  cidr_block = local.private_subnet_1
  tags = local.common_tags_private
}
resource "aws_subnet" "private_subnet_2" {
  vpc_id = var.vpc_id
  cidr_block = local.private_subnet_2
  tags = local.common_tags_private
}

# Exports subnet ID values to be used by calling modules
output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id_1" {
  value = aws_subnet.private_subnet_1.id
}

output "private_subnet_id_2" {
  value = aws_subnet.private_subnet_2.id
}