module "aws_vpc" {

  source = "../../modules/vpc"

  environment  = var.environment
  managed_by   = var.managed_by
  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
  aws_region = var.aws_region


  public_subnets     = var.public_subnets
  private_subnets = var.private_subnets

  availability_zones = var.availability_zones
  igw_name = var.igw_name
  public_rt_name = var.public_rt_name



}



