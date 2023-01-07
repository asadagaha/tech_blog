variable "app" {}
variable "env" {}
variable "region" {}
variable "web_container_name" {}
variable "acm_arn" {}
variable "cognito_admin_user_email" {}
variable "github_repository" {}

data "aws_caller_identity" "self" {}
locals {
  account_id = data.aws_caller_identity.self.account_id
}