module "aws_vpc" {

  source = "../../modules/vpc"

  environment  = var.environment
  managed_by   = var.managed_by
  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
  aws_region = var.aws_region





}

