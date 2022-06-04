###############################################################################
# セキュリティグループ
###############################################################################
# SSH通信用
resource "aws_security_group" "ssh_sg" {
  # セキュリティグループ名
  name        = "${var.prefix}-ssh-sg"
  description = "${var.prefix}-ssh-sg"
  # 紐付けVPC
  vpc_id = aws_vpc.vpc.id

  # アウトバウンドはここに記載
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # タグ
  tags = {
    Name = "${var.prefix}-ssh-sg"
  }
}

# SSH通信用(セキュリティグループのインバウンド用設定1)
resource "aws_security_group_rule" "http-sg-inbound" {
  type      = "ingress"
  from_port = 22
  to_port   = 22
  protocol  = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]

  # ここでweb_serverセキュリティグループに紐付け
  security_group_id = aws_security_group.ssh_sg.id
}

# HTTP通信用
resource "aws_security_group" "httpd_sg" {
  # セキュリティグループ名
  name        = "${var.prefix}-http-sg"
  description = "${var.prefix}-http-sg"
  # 紐付けVPC
  vpc_id = aws_vpc.vpc.id

  # アウトバウンドはここに記載
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # タグ
  tags = {
    Name = "${var.prefix}-http-sg"
  }
}

# HTTP通信用(セキュリティグループのインバウンド用設定1)
resource "aws_security_group_rule" "http_sg_inbound" {
  type      = "ingress"
  from_port = 80
  to_port   = 80
  protocol  = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]

  # ここでweb_serverセキュリティグループに紐付け
  security_group_id = aws_security_group.httpd_sg.id
}

# HTTP通信用(セキュリティグループのインバウンド用設定2)
resource "aws_security_group_rule" "https_sg_inbound" {
  type      = "ingress"
  from_port = 443
  to_port   = 443
  protocol  = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]

  # ここでweb_serverセキュリティグループに紐付け
  security_group_id = aws_security_group.httpd_sg.id
}
