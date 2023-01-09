module "vpc" {
  source             = "./module/vpc"
  app                = var.app
  env                = var.env
  region             = var.region
  vpc_endpoint_sg_id = module.security_group.vpc_endpoint_sg_id
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
module "cloudwatch" {
  source = "./module/cloudwatch"
  app    = var.app
  env    = var.env
}
module "elb" {
  source     = "./module/elb"
  app        = var.app
  env        = var.env
  vpc_id     = module.vpc.vpc_id
  subnet_ids = [module.vpc.subned_public_1a_id, module.vpc.subned_public_1c_id]
  alb_sg_id  = module.security_group.alb_sg_id
  acm_arn    = var.acm_arn
}
module "ecr" {
  source = "./module/ecr"
  app    = var.app
  env    = var.env
}
module "ecs" {
  source                       = "./module/ecs"
  account_id                   = local.account_id
  region                       = var.region
  app                          = var.app
  env                          = var.env
  vpc_id                       = module.vpc.vpc_id
  target_group_arn             = module.elb.target_group_arn
  subnet_ids                   = [module.vpc.subned_public_1a_id, module.vpc.subned_public_1c_id]
  ecs_sg_id                    = module.security_group.ecs_sg_id
  ecs_task_execution_role_arn  = module.iam.ecs_task_execution_role_arn
  cloudwatch_log_group_for_ecs = module.cloudwatch.cloudwatch_log_group_for_ecs
}
