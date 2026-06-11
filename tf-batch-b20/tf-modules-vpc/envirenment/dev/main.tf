module "aws_vpc" {

  source = "../../modules/vpc"

  environment  = var.environment
  managed_by   = var.managed_by
  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
  aws_region   = var.aws_region


  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  availability_zones = var.availability_zones
  igw_name           = var.igw_name
  public_rt_name     = var.public_rt_name



}


module "security_groups" {

  source = "../../modules/security_groups"
  aws_region = var.aws_region
  environment = var.environment
  managed_by = var.managed_by
  project_name = var.project_name
  vpc_id      = module.aws_vpc.vpc_id

  }

# module "aws_ec2" {
#   source = "../../modules/ec2"

#   ami             = var.ami_id
#   instance_type   = var.instance_type
#   key_name        = var.key_name
#   subnet_id       = var.subnet_id
#   security_groups = var.security_groups


# }





