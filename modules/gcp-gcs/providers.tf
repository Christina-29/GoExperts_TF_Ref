terraform {
  required_providers {
    google = { 
      source = "hashicorp/google"
      version = "3.5.0"
    }   
  }
}

provider "google" {
  //The credential file must be provided under your applications folder
  credentials = file(var.credentials_file)

  project = var.project_id
  region  = var.region
}

