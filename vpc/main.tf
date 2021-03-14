variable "cidr" {}

resource "aws_vpc" "x" {
  cidr_block = var.cidr
  tags = {
    Name = "gpalacio-training-vpc"
    owner = "gpalacio"
    project = "terraform/multiple-region-training"
  }
}

output "vpc_id" {
  value = aws_vpc.x.id
}