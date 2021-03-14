variable "vpc_id" {}
variable "vpc_cidr" {}

resource "aws_subnet" "public_subnet" {
  vpc_id = var.vpc_id
  cidr_block = local.public_subnet
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id = var.vpc_id
  cidr_block = local.private_subnet_1
}
resource "aws_subnet" "private_subnet_2" {
  vpc_id = var.vpc_id
  cidr_block = local.private_subnet_2
}
