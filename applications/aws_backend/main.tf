# Just Supporting Infrastructures

provider "aws" {
	region = "ap-southeast-2"
}

data "aws_availability_zones" "available" {}

module "aws_backend" {
  source                = "../../modules/aws-ecs-alb-asg"
  prefix                = "goexpert-uat"
  vpc_cidr              = "10.0.0.0/16"
  vpc_azs               = length(var.availability_zones) == 0 ? data.aws_availability_zones.available.names : var.availability_zones
  instance_profile_arn  = var.instance_profile_arn //input on terminal or in *.tfvars file
  ecs_task_role         = var.ecs_task_role  //input on terminal or in *.tfvars file
  instance_type         = "t2.micro"
  key_name              = "ECS_INSTANCE"  //Key pairs for EC2 instance
  image                 = "goexpert/backend:latest"  //ECR image name
  container_port        = 5000
  environment_file_path = var.environment_file_path  //input on terminal or in *.tfvars file
}
