locals {
  # Private range RFC-1918
  private_ranges = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]

  # Defines a map of rules, each containing protocol, port, type (ingress/egress) & description
  my_sg_rules = {
    # Inbound HTTP
    1: {
      protocol: "tcp"
      direction: "ingress"
      port: "80"
      cidr: local.private_ranges
      description: "HTTP from private space"
    }
    # Inbound HTTPS
    2: {
      protocol: "tcp"
      direction: "ingress"
      port: "443"
      cidr: local.private_ranges
      description: "HTTP from private space"
    }
    # Inbound DNS
    3: {
      protocol: "udp"
      direction: "ingress"
      port: "43"
      description: "DNS queries from private space"
      cidr: local.private_ranges
    }
    4: {
      protocol: "udp"
      direction: "ingress"
      port: "500"
      cidr: local.private_ranges
      description: "IPsec from private space"
    }
    # Outbound HTTPS everywhere
    5: {
      protocol: "tcp"
      direction: "egress"
      port: "443"
      cidr: ["0.0.0.0/0"]
      description: "Outbound HTTPS"
    }
  }
}