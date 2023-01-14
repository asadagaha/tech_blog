module "vpc" {
  source = "./module/vpc"
  app    = var.app
  env    = var.env
  region = var.region
}
module "iam" {
  source            = "./module/iam"
  app               = var.app
  env               = var.env
  github_repository = var.github_repository
}
module "security_group" {
  source   = "./module/security_group"
  app      = var.app
  env      = var.env
  vpc_id   = module.vpc.vpc_id
  vpc_cidr = module.vpc.vpc_cidr
}
module "cognito" {
  source           = "./module/cognito"
  app              = var.app
  env              = var.env
  region           = var.region
  admin_user_email = var.cognito_admin_user_email
}
module "ecr" {
  source = "./module/ecr"
  app    = var.app
  env    = var.env
}
