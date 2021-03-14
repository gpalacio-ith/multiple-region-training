locals {
  common_tags_private = {
    Name = "gpalacio-private-rt-training"
    owner = "gpalacio"
    project = "terraform/multiple-region-training"
  }

  common_tags_public = {
    Name = "gpalacio-public-rt-training"
    owner = "gpalacio"
    project = "terraform/multiple-region-training"
  }
}