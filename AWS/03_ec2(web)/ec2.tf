###############################################################################
# EC2
###############################################################################
resource "aws_instance" "ec2" {
  # 無料用AMI
  ami           = "ami-02c3627b04781eada"
  instance_type = "t2.micro"
  # キーペアには既存のキー名を指定
  key_name = var.ec2_keypair
  # サブネット
  subnet_id = aws_subnet.public_subnet_1a.id
  # セキュリテイグループ
  vpc_security_group_ids = [
    aws_security_group.ssh_sg.id,
    aws_security_group.httpd_sg.id
  ]
  # 初回起動時用の実行スクリプト
  user_data = file("scripts/install.sh")
  # タグ
  tags = {
    Name = "${var.prefix}-ec2"
  }
}
