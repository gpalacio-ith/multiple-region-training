locals {
  ec2_tags = {
    Name: "gpalacio-ec2-training"
    purpose = "terraform training"
    project = "terraform/multiple-region-training"
  }
}