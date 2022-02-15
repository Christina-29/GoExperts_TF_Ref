# Input variable definitions

variable "aws_region" {
  description = "AWS region for all resources."

  type    = string
  default = "ap-southeast-2"
}

variable "prefix" {
  description = "The prefix of the project"
  type        = string
}

variable "func" {
  description = "Lambda function name"
  type        = string
}

variable "entrypoint" {
  description = "Lambda function entrypoint for handler"
  type        = string
}

variable "func_dir" {
  description = "The directory that saves the Lambda functions"
  type        = string
}
