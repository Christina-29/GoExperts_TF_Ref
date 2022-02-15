variable "region" {
  description = "The region of your website except for the acm, which MUST be us-east-1"
  type        = string
} 

variable "lockname" {
  description = "The name of the dynamodb_table for locking the terraform.tfstate"
  type        = string
} 
