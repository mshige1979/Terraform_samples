# AWS用変数
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}

# キーペア
variable "ec2_keypair" {}

# リソースのプレフィックス用
variable "prefix" {
  default = "mshige1979-tf"
}
