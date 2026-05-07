module "vpc-stack" {
  source = "../../modules/vpc"

  environment    = terraform.workspace
  vpc_cidr       = var.vpc_cidr
  public_subnet  = var.public_subnet
  private_subnet = var.private_subnet
  az1            = var.az1
  az2            = var.az2
  az3            = var.az3

  }





