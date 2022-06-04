# AWS用変数
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}

# リソースのプレフィックス用
variable "prefix" {
  default = "mshige1979-tf"
}
