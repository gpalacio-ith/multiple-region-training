# multiple-region-training
Based on this project: https://github.com/chrismarget/multi-region-terraform-example

This projects aims to create two different VPCs, with their corresponding public/private subnets 
and connect them together using VPC peering.

IP addressing is divided as follows:
* VPC CIDR blocks are /24
* Subnets within the VPC are /28s
    * First /28 subnet is the public subnet
    * Second /28 is private
    * Third /28 is private