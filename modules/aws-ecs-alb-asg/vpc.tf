module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.18.0"

  name = "${var.prefix}-vpc"
  cidr = var.vpc_cidr
  azs  = var.vpc_azs

  public_subnets = [for i in range(length(var.vpc_azs)) : cidrsubnet(var.vpc_cidr, 8, i)]

  enable_nat_gateway               = false
  enable_dhcp_options              = true
  dhcp_options_domain_name_servers = ["AmazonProvidedDNS"]

  enable_ipv6                                   = var.enable_ipv6
  assign_ipv6_address_on_creation               = var.enable_ipv6
  public_subnet_assign_ipv6_address_on_creation = var.enable_ipv6
  public_subnet_ipv6_prefixes                   = range(length(var.vpc_azs))
}