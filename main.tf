module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = "10.0.0.0/16"
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
