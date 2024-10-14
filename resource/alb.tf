# ターゲットグループ
resource "aws_lb_target_group" "tg" {
  name     = "tf-test-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.main_vpc

  health_check {
    path                = "/" ############# /index.phpなどに変更する必要があるかもしれない
    protocol            = "HTTP"
    matcher             = "200"
    port                = "traffic-port"
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
  security_groups    = var.alb_sg
  subnets            = [var.public_subnet_1a, var.public_subnet_1c]

  tags = {
    Name = "tf-test-alb"
  }
}

# リスナー 443
resource "aws_lb_listener" "alb_https" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 443
  protocol          = "HTTPS"

  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

