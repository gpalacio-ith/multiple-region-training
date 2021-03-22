# Output value to be used by EC2 module
output "sg_id" {
  value = aws_security_group.new-sg-homework.id
}