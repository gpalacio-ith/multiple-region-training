variable "vpc_cidr" {
  type = map(string)
  default = {
    us-east-1 = "10.128.0.0/24"
    us-east-2 = "10.129.0.0/24"
  }
}
