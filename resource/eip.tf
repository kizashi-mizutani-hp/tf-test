# EIPの作成
resource "aws_eip" "bastion_eip" {
  tags = {
    Name       = "tf-test-bastion-eip"
    CostCenter = var.cost_center
  }
}

# EIPのアタッチ
resource "aws_eip_association" "bastion_eip_assoc" {
  instance_id   = aws_instance.bastion.id
  allocation_id = aws_eip.bastion_eip.id
}
