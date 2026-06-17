# S3 OAC
resource "aws_cloudfront_origin_access_control" "oac" {
    name = "s3-oac"
    origin_access_control_origin_type = "s3"
    signing_behavior = "always"
    signing_protocol = "sigv4"
}

# CloudFront Distribution
resource "aws_cloudfront_distribution" "s3_distribution" {
    origin {
        domain_name = aws_s3_bucket.s3static.bucket_regional_domain_name
        origin_id = "S3-Website"
        origin_access_control_id = aws_cloudfront_origin_access_control.oac.id
        
    }

    enabled = true
    default_root_object = "index.html"

    default_cache_behavior {

        allowed_methods = ["GET", "HEAD"]
        cached_methods = ["GET", "HEAD"]
        target_origin_id = "S3-Website"

        forwarded_values {
            query_string = false
            cookies {
                forward = "none"
            }
        }

        viewer_protocol_policy = "redirect-to-https"
        min_ttl = 0
        default_ttl = 3600
        max_ttl = 86400
    }

    restrictions {
        geo_restriction {
            restriction_type = "none"
        }
    }
    tags = {
        Name = "Portfolio CloudFront"
    }

    viewer_certificate {
        cloudfront_default_certificate = true
    }
}