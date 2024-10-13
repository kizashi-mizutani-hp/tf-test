
# resource "aws_acm_certificate" "wordpress_cert" {
#   domain_name       = "mizutani.7tagon.com"  # 使用するドメインを指定
#   validation_method = "DNS"

#   tags = {
#     Name = "tf-test-acm-cert"
#   }
# }

# resource "aws_route53_record" "wordpress_cert_validation" {
#   name    = [aws_acm_certificate.wordpress_cert.domain_validation_options[0].resource_record_name]
#   type    = [aws_acm_certificate.wordpress_cert.domain_validation_options[0].resource_record_type]
#   zone_id = "Z055220039IXQ6KYLFFBI"  # Route53のゾーンID
#   records = [aws_acm_certificate.wordpress_cert.domain_validation_options[0].resource_record_value]
#   ttl     = 60
# }

# resource "aws_acm_certificate_validation" "wordpress_cert_validation" {
#   certificate_arn         = aws_acm_certificate.wordpress_cert.arn
#   validation_record_fqdns = [aws_route53_record.wordpress_cert_validation.fqdn]
# }


resource "aws_route53_record" "wordpress_cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.wordpress_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      record = dvo.resource_record_value
    }
  }

  zone_id = "Z055220039IXQ6KYLFFBI"  # Route 53のゾーンID
  name    = each.value.name
  type    = each.value.type
  records = [each.value.record]
  ttl     = 60
}
