# A backet for the files
resource "aws_s3_bucket" "s3static" {
    region = "eu-central-1"
    bucket = "s3staticnad"

    tags = {
        Name = "s3staticnad"
        env = "dev"
    }
}

# Web site configuration
resource "aws_s3_bucket_website_configuration" "siteconfig" {
    bucket = aws_s3_bucket.s3static.id
    index_document {
        suffix = "index.html"
    }
}

# S3 restrictions
resource "aws_s3_bucket_public_access_block" "s3static_access" {
    bucket = aws_s3_bucket.s3static.id

    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true 
    restrict_public_buckets = true 
}

#S3 ownership
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


data "aws_iam_policy_document" "s3static_access_policy" {
    statement {
        sid = "AllowCloudfrontOnly"
        effect = "Allow"
        principals {
            type = "Service"
            identifiers = ["cloudfront.amazonaws.com"]
        }
        actions = [
            "s3:GetObject"
        ]
        resources = [
            "${aws_s3_bucket.s3static.arn}/*"
        ]

        condition {
            test = "StringEquals"
            variable = "AWS:SourceArn"
            values = [aws_cloudfront_distribution.s3_distribution.arn] 
        }
    }
}


