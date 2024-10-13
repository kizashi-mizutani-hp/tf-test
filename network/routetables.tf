# パブリックルートテーブルの作成
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "tf-test-public-route-table"
  }
}

# プライベートルートテーブルの作成（NATゲートウェイがある場合）
# NATゲートウェイの設定がない場合はこの部分は削除可能です。
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "tf-test-private-route-table"
  }
}

# パブリックサブネット1aへのルートテーブルアソシエーション
resource "aws_route_table_association" "public-1a" {
  subnet_id      = aws_subnet.public-1a.id
  route_table_id = aws_route_table.public.id
}

# パブリックサブネット1cへのルートテーブルアソシエーション
resource "aws_route_table_association" "public-1c" {
  subnet_id      = aws_subnet.public-1c.id
  route_table_id = aws_route_table.public.id
}

# プライベートサブネット1aへのルートテーブルアソシエーション
resource "aws_route_table_association" "private-1a" {
  subnet_id      = aws_subnet.private-1a.id
  route_table_id = aws_route_table.private.id
}

# プライベートサブネット1cへのルートテーブルアソシエーション
resource "aws_route_table_association" "private-1c" {
  subnet_id      = aws_subnet.private-1c.id
  route_table_id = aws_route_table.private.id
}