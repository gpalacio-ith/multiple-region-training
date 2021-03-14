# How to use locals across different modules?
locals {
  common_tags = {
    owner = "gpalacio"
    purpose = "terraform training"
    project = "terraform/multiple-region-training"
  }
}

# Name of profile in config file
locals {
  profile_name = "netops-training-admin"
}