
# 東京リージョン (ap-northeast-1) のACM証明書
resource "aws_acm_certificate" "cert" {
  provider                   = aws.ap-northeast-1  # 東京リージョン
  domain_name                = "*.mizutani.7tagon.com"
  subject_alternative_names   = ["mizutani.7tagon.com"]
  validation_method          = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "tf-test-acm"
  }
}

resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name = each.value.name
  records = [each.value.record]
  type = each.value.type
  ttl = "300"

  zone_id = "Z055220039IXQ6KYLFFBI"
}

# バージニアリージョン (us-east-1) のACM証明書 (CloudFront用)
resource "aws_acm_certificate" "us_east_cert" {
  provider                   = aws.us-east-1  # バージニアリージョン
  domain_name                = "*.mizutani.7tagon.com"
  subject_alternative_names   = ["mizutani.7tagon.com"]
  validation_method          = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "tf-test-acm-us-east"
  }
}

resource "aws_route53_record" "us_east_cert_validation" {
  provider = aws.us-east-1  # バージニアリージョン用のDNS検証
  for_each = {
    for dvo in aws_acm_certificate.us_east_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name = each.value.name
  records = [each.value.record]
  type = each.value.type
  ttl = "300"

  zone_id = "Z055220039IXQ6KYLFFBI"  # 既存のRoute 53ゾーンを使用
}
