variable "app" {}
variable "env" {}
variable "region" {}
variable "acm_arn" {}
variable "cognito_admin_user_email" {}
variable "github_repository" {}
variable "front_build_stage" {}
variable "db_host" {}
variable "db_username" {}
variable "db_password" {}
variable "db_engine_version" {}

data "aws_caller_identity" "self" {}
locals {
  account_id = data.aws_caller_identity.self.account_id
}