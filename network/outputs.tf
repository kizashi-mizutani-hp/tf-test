# プライベートサブネット1aのIDをエクスポート
output "private_subnet_1a_id" {
  value = aws_subnet.private-1a.id
}

# セキュリティグループのIDをエクスポート
output "security_group_ec2_id" {
  value = aws_security_group.ec2.id
}
