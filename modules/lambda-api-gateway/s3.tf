// S3 resources required to save Lambda functions

//Create s3 bucket
resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "${var.prefix}-${var.func}"
  acl    = "private"
  
  force_destroy = true
 
  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["*"]
    max_age_seconds = 3000
  }
 }

// Archive and upload the function to S3 bucket
data "archive_file" "lambda_func" {
  type        = "zip"
  source_dir  = "${path.module}/functions/${var.func_dir}"
  output_path = "${path.module}/functions/${var.func_dir}.zip"
}

resource "aws_s3_bucket_object" "lambda_func" {
  bucket = aws_s3_bucket.lambda_bucket.id
  key    = "${var.func_dir}.zip"
  source = data.archive_file.lambda_func.output_path
  etag   = filemd5(data.archive_file.lambda_func.output_path)
}

