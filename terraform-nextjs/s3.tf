# A backet for the APP
resource "aws_s3_bucket" "s3static" {
  bucket = "s3staticnad"

  tags = {
    Name = "s3staticnad"
    env  = "dev"
  }
}

# S3 Restrictions
resource "aws_s3_bucket_public_access_block" "s3static_access" {
  bucket = aws_s3_bucket.s3static.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#S3 Ownership
resource "aws_s3_bucket_ownership_controls" "s3staticOwnership" {
  bucket = aws_s3_bucket.s3static.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

# S3 Policy
resource "aws_s3_bucket_policy" "s3_policy_attachment" {
  bucket = aws_s3_bucket.s3static.id
  policy = data.aws_iam_policy_document.s3static_access_policy.json
}


data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "s3static_access_policy" {
  statement {
    sid    = "AllowCloudfrontOnly"
    effect = "Allow"
    
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
    actions = [
      "s3:GetObject"
    ]
    resources = [
      "${aws_s3_bucket.s3static.arn}/*"
    ]

  }
}


