# EC2インスタンスの作成
resource "aws_instance" "ec2" {
  ami           = "ami-0ef29ab52ff72213b"  # Amazon Linux 2023 AMI
  instance_type = "t2.micro"
  subnet_id     = var.private_subnet_1a_id
  key_name      = "wp-test"                # 事前に作成したキーペアを指定

  security_groups = var.ec2_sg_id

  tags = {
    Name = "tf-test-ec2"
    CostCenter = var.cost_center
  }
}

# bastionの作成
resource "aws_instance" "bastion" {
  ami           = "ami-0ef29ab52ff72213b"  # Amazon Linux 2023 AMI
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_1a_id
  key_name      = "wp-test"                # 事前に作成したキーペアを指定

  security_groups = var.bastion_sg_id

  tags = {
    Name = "tf-test-bastion"
    CostCenter = var.cost_center
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo dnf update -y
              sudo dnf install -y httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<html><body><h1>OK</h1></body></html>" > /var/www/html/status
              EOF
}
