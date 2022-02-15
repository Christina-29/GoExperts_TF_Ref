
module "alb_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = ">3.2.0"

  name   = "${var.prefix}-alb-sg"
  vpc_id = module.vpc.vpc_id

  # Ingress for HTTP
  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_ipv6_cidr_blocks = ["::/0"]
  ingress_rules            = ["http-80-tcp"]

  # Allow all egress
  egress_cidr_blocks      = ["0.0.0.0/0"]
  egress_ipv6_cidr_blocks = ["::/0"]
  egress_rules            = ["all-all"]
}

module "ec2_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = ">3.2.0"

  name   = "${var.prefix}-ec2-sg"
  vpc_id = module.vpc.vpc_id


  # Ingress from ALB only
  number_of_computed_ingress_with_source_security_group_id = 1
  computed_ingress_with_source_security_group_id = [
    {
      rule                     = "all-all"
      source_security_group_id = module.alb_security_group.security_group_id
    }
  ]

  # Allow all egress
  egress_cidr_blocks      = ["0.0.0.0/0"]
  egress_ipv6_cidr_blocks = ["::/0"]
  egress_rules            = ["all-all"]
}