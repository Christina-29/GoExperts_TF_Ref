variable "credentials_file"{
  description = "Credentials file (.json) to run the task, must be provided under the folder"
  type        = string
}

variable "bucket_name" {
  description = "The name of the bucket"
  type        = string
}

variable "domain_name" {
  description = "The domain name of the website hosted by the bucket"
  type        = string
}


variable "project_id" {
  description = "The project_id of the project to which bucket will be created"
  type        = string
}

variable "region" {
  description = "The region where the bucket belongs"
  default     = "australia-southeast1"
  type        = string
}
