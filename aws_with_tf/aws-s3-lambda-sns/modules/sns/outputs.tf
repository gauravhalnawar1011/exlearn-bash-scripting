#################################################
# SNS TOPIC ARN
#################################################

output "sns_topic_arn" {

  value = aws_sns_topic.s3_upload_alerts.arn
}

#################################################
# SNS TOPIC NAME
#################################################

output "sns_topic_name" {

  value = aws_sns_topic.s3_upload_alerts.name
}

#################################################
# SUBSCRIPTION ARN
#################################################

output "subscription_arn" {

  value = aws_sns_topic_subscription.email.arn
}