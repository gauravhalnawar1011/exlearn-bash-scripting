#################################################
# EMAIL SUBSCRIPTION
#################################################

resource "aws_sns_topic_subscription" "email" {

  topic_arn = aws_sns_topic.s3_upload_alerts.arn

  protocol = "email"

  endpoint = var.email_address
}