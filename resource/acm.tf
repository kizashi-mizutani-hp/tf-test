
resource "aws_acm_certificate" "cert" {
  # ワイルドカード証明書で同じドメイン内の複数のサイトを保護
  domain_name               = "*.mizutani.7tagon.com"
  # ネイキッドドメインや apex ドメイン(ドメイン名そのもの)を保護
  subject_alternative_names = ["mizutani.7tagon.com"]
  # ACMドメイン検証方法にDNS検証を指定
  validation_method         = "DNS"

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

  # レコードを追加するドメインのホストゾーンIDを指定
  zone_id = "Z055220039IXQ6KYLFFBI"
}