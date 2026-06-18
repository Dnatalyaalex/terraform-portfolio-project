output "bucket_website_endpoint" {
  value = aws_s3_bucket.s3static.website_endpoint
}

output "cloudfront_url" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}