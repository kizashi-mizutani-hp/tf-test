# ターゲットグループ
resource "aws_lb_target_group" "tg" {
  name     = "tf-test-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.network.vpc_id

  health_check {
    path                = "/" ############# /index.phpなどに変更する必要があるかもしれない
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 2
  }

  tags = {
    Name = "tf-test-tg"
  }
}

# alb
resource "aws_lb" "alb" {
  name               = "tf-test-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [module.network.public_subnet_1a_id, module.network.public_subnet_1c_id]

  tags = {
    Name = "tf-test-alb"
  }
}

# リスナー 443
resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 443
  protocol          = "HTTPS"

  ssl_policy        = "ELBSecurityPolicy-2016-08"  # 必要に応じてセキュリティポリシーを変更
  certificate_arn   = [aws_acm_certificate_validation.wordpress_cert_validation.certificate_arn]

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

