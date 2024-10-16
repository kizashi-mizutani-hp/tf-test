# ターゲットグループ
resource "aws_lb_target_group" "tg" {
  name     = "tf-test-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.main_vpc_id
  target_type = "instance"

  health_check {
    path                = "/status"
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

# EC2をターゲットにアタッチする設定
resource "aws_lb_target_group_attachment" "ec2_attachment" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.ec2.id
  port             = 80
}

# alb
resource "aws_lb" "alb" {
  name               = "tf-test-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.alb_sg_id
  subnets            = [var.public_subnet_1a_id, var.public_subnet_1c_id]

  tags = {
    Name = "tf-test-alb"
    CostCenter = var.cost_center
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

