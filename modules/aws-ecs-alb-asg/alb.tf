module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "5.13.0"

  name               = "${var.prefix}-alb"
  load_balancer_type = "application"
  security_groups    = [module.alb_security_group.security_group_id]
  subnets            = module.vpc.public_subnets
  vpc_id             = module.vpc.vpc_id

  ip_address_type = var.enable_ipv6 ? "dualstack" : "ipv4"

  listener_ssl_policy_default = "ELBSecurityPolicy-2016-08"
  http_tcp_listeners = [
    {
      target_group_index = 0
      port               = 80
      protocol           = "HTTP"
    },
  ]
  target_groups = [
    {
      name             = "${var.prefix}-app"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
    },
  ]
}
