module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 3.0"

  name = "${var.prefix}-asg"

  image_id                    = data.aws_ssm_parameter.ami_image.value
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  security_groups             = [module.ec2_security_group.security_group_id]
  vpc_zone_identifier         = module.vpc.public_subnets
  min_size                    = 1
  max_size                    = 2
  desired_capacity            = 1
  health_check_type           = "EC2"
  associate_public_ip_address = true
  user_data = templatefile("${path.module}/templates/ec2_userdata.tpl", {
    ecs_cluster = aws_ecs_cluster.main.name
  })
  iam_instance_profile = var.instance_profile_arn
}
