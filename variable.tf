variable "vpc_cidr" {
  default = {
    us-west-1 = "10.128.0.0/24"
    us-west-2 = "10.128.0.0/24"
  }
}
