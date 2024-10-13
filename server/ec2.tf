# EC2インスタンスの作成
resource "aws_instance" "ec2" {
  ami           = "ami-0ef29ab52ff72213b"  # Amazon Linux 2023 AMI
  instance_type = "t2.micro"
  subnet_id     = var.private_subnet_id
  key_name      = "wp-test"                # 事前に作成したキーペアを指定

  security_groups = var.ec2_sg

  tags = {
    Name = "tf-test-ec2"
  }
}

# bastionの作成
resource "aws_instance" "bastion" {
  ami           = "ami-0ef29ab52ff72213b"  # Amazon Linux 2023 AMI
  instance_type = "t2.micro"
  subnet_id     = var.private_subnet_id
  key_name      = "wp-test"                # 事前に作成したキーペアを指定

  security_groups = var.bastion_sg

  tags = {
    Name = "tf-test-ec2"
  }
}
