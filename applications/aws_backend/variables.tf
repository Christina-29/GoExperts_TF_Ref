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

variable "environment_file_path" {
  description = "The path of the environmentfile for the container in task definition"
  type        = string
}
