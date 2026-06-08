#################################################
# ZIP LAMBDA CODE
#################################################

data "archive_file" "lambda_zip" {

  type = "zip"

  source_file = "${path.module}/code/lambda_function.py"

  output_path = "${path.module}/lambda.zip"
}

#################################################
# LAMBDA FUNCTION
#################################################

resource "aws_lambda_function" "s3_upload_notifier" {

  function_name = "${var.environment}-s3-upload-notifier"

  filename = data.archive_file.lambda_zip.output_path

  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  role = var.lambda_role_arn

  handler = "lambda_function.lambda_handler"

  runtime = "python3.12"

  timeout = 30

  memory_size = 128

  environment {

    variables = {

      SNS_TOPIC_ARN = var.sns_topic_arn
    }
  }

  tags = {

    Name = "${var.environment}-s3-upload-notifier"

    Environment = var.environment

    Project = var.project_name

    ManagedBy = "Terraform"
  }
}


