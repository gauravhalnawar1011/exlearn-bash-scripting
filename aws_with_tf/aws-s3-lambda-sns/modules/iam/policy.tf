#################################################
# CLOUDWATCH LOGS
#################################################

resource "aws_iam_role_policy_attachment" "basic_execution" {

  role = aws_iam_role.lambda_role.name

  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

#################################################
# SNS PUBLISH POLICY
#################################################

resource "aws_iam_policy" "sns_publish" {

  name = "${var.environment}-lambda-sns-publish"

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Action = [

          "sns:Publish"
        ]

        Resource = var.sns_topic_arn
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "sns_publish" {

  role = aws_iam_role.lambda_role.name

  policy_arn = aws_iam_policy.sns_publish.arn
}