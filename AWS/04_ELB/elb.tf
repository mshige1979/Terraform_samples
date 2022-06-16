# ELB
resource "aws_lb" "default" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  # セキュリティグループ
  security_groups    = [aws_security_group.httpd_sg.id]
  # サブネット
  subnets            = [
    aws_subnet.public_subnet_1a.id,
    aws_subnet.public_subnet_1c.id,
  ]

  # タグ
  tags = {
    Name = "${var.prefix}-elb"
  }
}

# リスナー
resource "aws_lb_listener" "web" {
  load_balancer_arn = aws_lb.default.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web.arn
  }

}

# ターゲットグループ
resource "aws_lb_target_group" "web" {
  name        = "${var.prefix}-elb-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc.id
  # インスタンス
  target_type = "instance"

  # ヘルスチェック
  health_check {
    interval            = 30
    path                = "/"
    port                = 80
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
    matcher             = 200
  }


  # タグ
  tags = {
    Name = "${var.prefix}-elb-tg"
  }
}

# ターゲットグループにインスタンスを紐付け
resource "aws_lb_target_group_attachment" "web" {
  target_group_arn = aws_lb_target_group.web.arn
  target_id        = aws_instance.ec2.id
  port             = 80
}