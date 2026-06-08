#################################################
# LOCAL TAGS
#################################################

locals {

  common_tags = {

    Environment = var.environment

    ManagedBy = "Terraform"

    Project = var.project_name
  }
}

#################################################
# SNS TOPIC
#################################################

resource "aws_sns_topic" "s3_upload_alerts" {

  name = "${var.environment}-s3-upload-alerts-exlearn"

  tags = merge(

    local.common_tags,

    {

      Name = "${var.environment}-s3-upload-alerts"
    }
  )
}