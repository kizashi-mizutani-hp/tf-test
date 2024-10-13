# パブリックサブネットの作成
resource "aws_subnet" "public-1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "tf-test-public-1a"
  }
}

resource "aws_subnet" "public-1c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "tf-test-public-1c"
  }
}


# プライベートサブネットの作成
resource "aws_subnet" "private-1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "tf-test-private-1a"
  }
}

resource "aws_subnet" "private-1c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "tf-test-private-1c"
  }
}