provider "aws" {
  region = "ap-southeast-2"
}

module "dynamodb_lock_tfstate" {
  source   = "../../modules/aws-dynamodb-lock"
  region   = "ap-southeast-2"
  lockname = "goexperts-lock"
}
