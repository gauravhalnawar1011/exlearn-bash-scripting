output "lambda_function_arn" {

  value = aws_lambda_function.s3_upload_notifier.arn
}

output "lambda_function_name" {

  value = aws_lambda_function.s3_upload_notifier.function_name
}