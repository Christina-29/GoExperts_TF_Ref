variable "instance_profile_arn" {
  description = "Instance Profile to use for EC2 to join to ECS Cluster. See `modules/iam/ecs-instance-profile`"
  type        = string
}

variable "ecs_task_role" {
  description = "The role for ECS task definition and task execution"
  type        = string
}

variable "availability_zones" {
  description = "Override automatic detection of availability zones"
  default     = []
  type        = list(string)
}

variable "enable_ipv6" {
  description = "Enable IPv6?"
  default     = false
  type        = bool
}

variable "prefix" {
  description = "Prefix for all the ecs resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  type        = string
}

variable "vpc_azs" {
  description = "Availabe zones for VPC"
  type        = list(string)
}

variable "key_name" {
  description = "The key pair used for EC2 instance"
  type        = string
}

variable "image" {
  description = "The ECR image for the ECS task"
  type        = string
}

variable "instance_type" {
  description = "The type of the EC2 instance"
  type        = string
  default     = "t2.micro"  
}

variable "container_port" {
  description = "The port for the container running in EC2"
  type        = number
}

variable "environment_file_path" {
  description = "The path of the environmentfile for the container in task definition"
  type        = string
}
