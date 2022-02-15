terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket  = "jr-terraform-state-file"
    key     = "goexperts.tfstate"
    region  = "ap-southeast-2"
    encrypt = true
    workspace_key_prefix = "goexperts-fe"
  }
}

provider "aws" {
  region = "ap-southeast-2"
}

provider "aws" {
  alias  = "acm_provider"
  region = "us-east-1"
}


module "cloudfront_s3_website_with_domain" {
  source         = "../../modules/aws-s3-cloudfront"
  zone_id        = var.zone_id
  domain_name    = terraform.workspace == "prod" ? "goexperts.net" : "${terraform.workspace}.goexperts.net"
  bucket_name    = terraform.workspace == "prod" ? "goexperts.net" : "${terraform.workspace}.goexperts.net"
  common_tags    = { Project = "goexperts-${terraform.workspace}" }
  region         = "ap-southeast-2"
  environment    = terraform.workspace
}
