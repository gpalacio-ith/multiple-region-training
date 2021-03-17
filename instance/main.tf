variable private_subnets {}

# Obtains from AWS the latests AMI for an ubuntu server image
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# Creates the instance & selects the type (t2,t3,etc)
# modules received subnets IDs from per-region module
resource "aws_instance" "example" {
  for_each = var.private_subnets

  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = each.value
  tags = local.ec2_tags
}