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
# LAMBDA ASSUME ROLE POLICY
#################################################

data "aws_iam_policy_document" "assume_role" {

  statement {

    effect = "Allow"

    principals {

      type = "Service"

      identifiers = [
        "lambda.amazonaws.com"
      ]
    }

    actions = [
      "sts:AssumeRole"
    ]
  }
}

#################################################
# IAM ROLE
#################################################

resource "aws_iam_role" "lambda_role" {

  name = "${var.environment}-lambda-s3-sns-role"

  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = merge(

    local.common_tags,

    {

      Name = "${var.environment}-lambda-role"
    }
  )
}