output "bucket_name" {

  value = module.s3.bucket_name
}

output "bucket_arn" {

  value = module.s3.bucket_arn
}

output "lambda_name" {

  value = module.lambda.lambda_function_name
}

output "lambda_arn" {

  value = module.lambda.lambda_function_arn
}

output "sns_topic_arn" {

  value = module.sns.sns_topic_arn
}