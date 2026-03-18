module "vpc" {
  source = "./modules/vpc"
}

module "alb" {
  source = "./modules/alb"

  public_subnets = module.vpc.public_subnets
}

module "autoscaling" {
  source = "./modules/autoscaling"
  subnets = module.vpc.private_subnets
}

module "rds" {
  source = "./modules/rds"
}

module "s3" {
  source = "./modules/s3"
}
