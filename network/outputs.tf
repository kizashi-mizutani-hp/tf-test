
/* ########################################

 モジュール内で作成されたリソースや値を外部に公開(出力)する定義
 ./main.tfに値を渡す

######################################## */

# VPCのIDをエクスポート
output "main_vpc_id" {
  value = aws_vpc.main.id
}

# パブリックサブネット1aのIDをエクスポート
output "public_subnet_1a_id" {
  value = aws_subnet.public_1a.id
}

# パブリックサブネット1cのIDをエクスポート
output "public_subnet_1c_id" {
  value = aws_subnet.public_1c.id
}

# プライベートサブネット1aのIDをエクスポート
output "private_subnet_1a_id" {
  value = aws_subnet.private_1a.id
}

# プライベートサブネット1cのIDをエクスポート
output "private_subnet_1c_id" {
  value = aws_subnet.private_1c.id
}

# セキュリティグループのIDをエクスポート
output "security_group_ec2_sg_id" {
  value = aws_security_group.ec2_sg.id
}

# セキュリティグループのIDをエクスポート
output "security_group_bastion_sg_id" {
  value = aws_security_group.bastion_sg.id
}

# セキュリティグループのIDをエクスポート
output "security_group_alb_sg_id" {
  value = aws_security_group.alb_sg.id
}
