# Terraform_samples

## install

### OSX(\_Mac)

```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

## 手順

デモ用準備として`AWS/01_demo/`のものを利用する

### 準備

設定情報をコピーし、AWS のアクセストークン、シークレットアクセストークンを設定する

```
cp -p terraform.tfvars.samples AWS/01_demo/terraform.tfvars
cd AWS/01_demo
```

### 初期化

```
terraform init
```

### 確認

```
terraform plan
```

### 作成

```
terraform apply
```

### 削除

```
terraform destroy
```

## demo リスト

| No  | 説明             | 　 URL                                                                                   |
| --- | ---------------- | ---------------------------------------------------------------------------------------- |
| 1   | VPC のみ         | [01_demo](https://github.com/mshige1979/Terraform_samples/tree/main/AWS/01_demo)         |
| 2   | ネットワーク関連 | [02_networks](https://github.com/mshige1979/Terraform_samples/tree/main/AWS/02_networks) |
