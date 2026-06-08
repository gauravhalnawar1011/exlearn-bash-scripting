#################################################
# SNS
#################################################

module "sns" {

  source = "../../modules/sns"

  environment = var.environment

  project_name = var.project_name

  email_address = var.email_address
}

#################################################
# IAM
#################################################

module "iam" {

  source = "../../modules/iam"

  environment = var.environment

  project_name = var.project_name

  sns_topic_arn = module.sns.sns_topic_arn
}

#################################################
# LAMBDA
#################################################

module "lambda" {

  source = "../../modules/lambda"

  environment = var.environment

  project_name = var.project_name

  lambda_role_arn = module.iam.lambda_role_arn

  sns_topic_arn = module.sns.sns_topic_arn
}

#################################################
# S3
#################################################

module "s3" {

  source = "../../modules/s3"

  environment = var.environment

  project_name = var.project_name

  lambda_function_arn = module.lambda.lambda_function_arn

  lambda_function_name = module.lambda.lambda_function_name
}


#################################################
# ALLOW S3 TO INVOKE LAMBDA
#################################################

resource "aws_lambda_permission" "allow_s3" {

  statement_id = "AllowExecutionFromS3"

  action = "lambda:InvokeFunction"

  function_name = module.lambda.lambda_function_name

  principal = "s3.amazonaws.com"

  source_arn = module.s3.bucket_arn
}

#################################################
# S3 NOTIFICATION
#################################################

#################################################
# S3 NOTIFICATION
#################################################

resource "aws_s3_bucket_notification" "notification" {

  bucket = module.s3.bucket_id

  lambda_function {

    lambda_function_arn = module.lambda.lambda_function_arn

    events = [
      "s3:ObjectCreated:*"
    ]
  }

  depends_on = [
    aws_lambda_permission.allow_s3
  ]
}