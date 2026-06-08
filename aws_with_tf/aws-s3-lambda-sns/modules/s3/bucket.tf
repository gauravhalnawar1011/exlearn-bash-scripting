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
# RANDOM SUFFIX
#################################################

resource "random_integer" "suffix" {

  min = 10000

  max = 99999
}

#################################################
# S3 BUCKET
#################################################

resource "aws_s3_bucket" "bucket" {

  bucket = "${var.environment}-s3-trigger-demo-${random_integer.suffix.result}"

  tags = merge(

    local.common_tags,

    {

      Name = "${var.environment}-s3-trigger-demo"
    }
  )
}

#################################################
# BLOCK PUBLIC ACCESS
#################################################

resource "aws_s3_bucket_public_access_block" "bucket" {

  bucket = aws_s3_bucket.bucket.id

  block_public_acls = true

  block_public_policy = true

  ignore_public_acls = true

  restrict_public_buckets = true
}

#################################################
# VERSIONING
#################################################

resource "aws_s3_bucket_versioning" "bucket" {

  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {

    status = "Enabled"
  }
}

#################################################
# SERVER SIDE ENCRYPTION
#################################################

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket" {

  bucket = aws_s3_bucket.bucket.id

  rule {

    apply_server_side_encryption_by_default {

      sse_algorithm = "AES256"
    }
  }
}

#################################################
# DEMO FILE
#################################################

resource "aws_s3_object" "demo_file" {

  bucket = aws_s3_bucket.bucket.id

  key = "test.txt"

  content = <<EOF
Hello from Terraform

S3 → Lambda → SNS Demo
EOF

  content_type = "text/plain"
}