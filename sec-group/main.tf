variable "vpc_id" {}

# Create a security-group with custom rules (defined by homerwork)
resource "aws_security_group" "new-sg-homework" {
  name = "gpalacio-terraform-training-homework"
  description = "homework for terraform training"
  vpc_id = var.vpc_id
  tags = {
    Name = "gpalacio-customer-sg"
    owner = "gpalacio"
    project = "terraform/multiple-region-training"
  }
}

# Cycles through all the rules defined in local and assigns them to the new sg
resource "aws_security_group_rule" "rules" {
  for_each = local.my_sg_rules
  from_port = each.value["port"]
  to_port = each.value["port"]
  protocol = each.value["protocol"]
  cidr_blocks = each.value["cidr"]
  type = each.value["direction"]
  description = each.value["description"]
  security_group_id = aws_security_group.new-sg-homework.id
}