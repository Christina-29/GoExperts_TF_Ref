variable "project_id" {
  description = "project id"
}

variable "location" {
  description = "location"
  default     = "australia-southeast1-a"
}

variable "region" {
  description = "region"
  default     = "australia-southeast1"
}

variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 2
  description = "number of gke nodes"
}

variable "cluster_name" {
  description = "cluster name"
}

variable "machine_type" {
  default     = "g1-small"
  description = "machine type for gke nodes"
}
