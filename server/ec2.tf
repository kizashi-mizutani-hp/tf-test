# EC2インスタンスの作成
resource "aws_instance" "wordpress" {
  ami           = "ami-0ef29ab52ff72213b"  # Amazon Linux 2023 AMI
  instance_type = "t2.micro"
  # subnet_id     = var.private-1a.id 
  subnet_id     = var.subnet_id 
  key_name      = "wp-test"                # 事前に作成したキーペアを指定

  # security_groups = [aws_security_group.ec2.id]
  security_groups = var.security_groups

  tags = {
    Name = "tf-test-ec2"
  }
}
