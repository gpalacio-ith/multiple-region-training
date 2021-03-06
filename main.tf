# The "per-region" module creates resources in a single region. We call it for
# each region (not particularly DRY) because terraform currently doesn't support
# looping over providers (https://github.com/hashicorp/terraform/issues/19932)
#
# There's no default provider (all have alias keyword), so every module,
# resource and data provider needs to have the provider explicitly set.
#
# We call the "per-region" module 3 times, each time with a different provider
# (different AWS region)
module "region-1" {
  source = "./per-region"
  providers = { aws = aws.us-east-1 }
  cidr = var.vpc_cidr
}

module "region-2" {
  source = "./per-region"
  providers = { aws = aws.us-east-2 }
  cidr = var.vpc_cidr
}

# The vpc-peering module needs to do work in two regions (one region requests a
# peering connection, the other region accepts the request), so the 'providers'
# block includes two providers. I've elected to pass one provider as the default
# provider for aws resources, and the other provider with the "aws.requesting"
# alias. This approach lets me cut down on 'provider' declarations inside the
# module a bit, but aliasing both is also a valid approach.
#
# Again, because of missing provider looping constructs, we're not DRY here.
# Three connections means three calls to the vpc-peering module.
module "peering_1" {
  source = "./vpc-peering"
  accepting_vpc_id = module.region-2.vpc_id
  requesting_vpc_id = module.region-1.vpc_id
  providers = {
    aws = aws.us-east-2                   # Default aws provider for module
    aws.requesting = aws.us-east-1        # Named/aliased provider for module
  }
}