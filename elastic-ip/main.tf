# Create EIP for NatGW
resource "aws_eip" "elastic-ip" {
  vpc         = false
  tags = local.common_tags
}

# Exports the allocation ID value
output "eip_id" {
  value = aws_eip.elastic-ip.id
}