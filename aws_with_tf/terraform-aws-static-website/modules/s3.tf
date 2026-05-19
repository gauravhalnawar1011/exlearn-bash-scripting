# S3 Bucket

resource "aws_s3_bucket" "site" {

  bucket = var.bucket_name

  force_destroy = false

  tags = {

    Name        = var.bucket_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = var.project_name
  }
}

# S3 Versioning

resource "aws_s3_bucket_versioning" "site" {

  bucket = aws_s3_bucket.site.id

  versioning_configuration {

    status = "Enabled"
  }
}

# S3 Encryption

resource "aws_s3_bucket_server_side_encryption_configuration" "site" {

  bucket = aws_s3_bucket.site.id

  rule {

    apply_server_side_encryption_by_default {

      sse_algorithm = "AES256"
    }
  }
}

# Ownership Controls

resource "aws_s3_bucket_ownership_controls" "site" {

  bucket = aws_s3_bucket.site.id

  rule {

    object_ownership = "BucketOwnerPreferred"
  }
}

# Public Access Block

resource "aws_s3_bucket_public_access_block" "site" {

  bucket = aws_s3_bucket.site.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Upload Website Files
resource "aws_s3_object" "site_files" {

  for_each = fileset("${path.module}/../website", "**/*")

  bucket = aws_s3_bucket.site.id

  key = each.value

  source = "${path.module}/../website/${each.value}"

  etag = filemd5("${path.module}/../website/${each.value}")

  content_type = lookup(
    {
      html = "text/html"
      css  = "text/css"
      js   = "application/javascript"
      png  = "image/png"
      jpg  = "image/jpeg"
      svg  = "image/svg+xml"
    },

    split(".", each.value)[length(split(".", each.value)) - 1],

    "binary/octet-stream"
  )
}

# S3 Bucket Policy

resource "aws_s3_bucket_policy" "site_policy" {

  bucket = aws_s3_bucket.site.id

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Sid = "AllowCloudFrontServicePrincipal"

        Effect = "Allow"

        Principal = {

          Service = "cloudfront.amazonaws.com"
        }

        Action = "s3:GetObject"

        Resource = "${aws_s3_bucket.site.arn}/*"

        Condition = {

          StringEquals = {

            "AWS:SourceArn" = aws_cloudfront_distribution.cdn.arn
          }
        }
      }
    ]
  })
}