variable "vpc_cidr" {
  type = "map"
  default = {
    us-west-1 = "10.128.0.0/24"
    us-west-2 = "10.129.0.0/24"
  }
}
