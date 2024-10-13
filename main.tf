# AWSプロバイダーの設定
provider "aws" {
  region = "ap-northeast-1"  # 東京リージョン
}

# VPCの作成
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "MainVPC"
  }
}

# サブネットの作成
resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "MainSubnet"
  }
}
