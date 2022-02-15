Terraform module for creating  all the infrastructures for the project GoExpert frontend.

The following resources will be created: 

  - Dynamodb table: store the state lock for terraform
  - Frontend:
	  - S3 bucket to save the staic website pages
	  - CloudFront distribution with https support
	  - Route53 record
	  - An SSL certificate with DNS verification
	  - Upload sample html file (optional)

Prerequisites:

  - AWS CLI environment configured
  - A S3 bucket is ready to save the terraform.tfstate (To be added to creation)
  - A hosted zone has been created, e.g. "willd.link", to which some CNAME records will be created for the SSL certificate

Usage example:

  - A Dynamodb is needed to lock the status, which MUST be created first by running terraform commands under deploy/backend-lock
  - The deploy/frontend is for deploying the frontend website
  - In each of the `deploy` directory, modify the variables to your own, and run terraform commands. e.g. 

  ```
        module "cloudfront_s3_website_with_domain" {
        source                = "../"
        zone_id               = "Your_own_hosted_zone_id"
        domain_name           = "your.domain.name"
        bucket_name           = "your.domain.name"
        common_tags           = {	Project = "goexpert-test"  }
        backend_bucket        = "envfiles.goexpert"
        region                = "ap-southeast-2"
    }
  ```
