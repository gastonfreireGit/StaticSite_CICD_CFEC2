data "aws_cloudfront_origin_access_identity" "staticsite-gf-oai" {
  id = "E26RWMOJBFTRWY"
}

data "aws_s3_bucket" "static-site-cicd" {
  bucket = var.s3_name
}

locals {
  ec2_origin_id = "myEC2Origin"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = var.ec2_origin
    origin_id   = local.ec2_origin_id
      custom_origin_config {
       http_port              = 80
       https_port             = 443
       origin_protocol_policy = "http-only"
       origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
     }
  }


  enabled             = true
  is_ipv6_enabled     = true
  comment             = var.cf_comment
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.ec2_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  # Cache behavior with precedence 0
  ordered_cache_behavior {
    path_pattern     = "/content/immutable/*"
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = local.ec2_origin_id

    forwarded_values {
      query_string = false
      headers      = ["Origin"]

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  # Cache behavior with precedence 1
  ordered_cache_behavior {
    path_pattern     = "/content/*"
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.ec2_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  price_class = "PriceClass_All"


    restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

    viewer_certificate {
    cloudfront_default_certificate = true
  }
}