resource "aws_lambda_function" "lambda_func" {
  function_name = var.func

  s3_bucket = aws_s3_bucket.lambda_bucket.id
  s3_key    = aws_s3_bucket_object.lambda_func.key

  runtime = "nodejs14.x"
  handler = "${var.entrypoint}.handler"

  source_code_hash = data.archive_file.lambda_func.output_base64sha256

  role = aws_iam_role.lambda_exec.arn
}

resource "aws_cloudwatch_log_group" "log_group" {
  name = "/aws/lambda/${aws_lambda_function.lambda_func.function_name}"

  retention_in_days = 30
}

resource "aws_iam_role" "lambda_exec" {
  name = "${var.prefix}-${var.func}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Sid    = ""
      Principal = { 
        Service = "lambda.amazonaws.com"
      }   
    }]   
  })  
}
