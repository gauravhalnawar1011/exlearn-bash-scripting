module "rds" {

  source = "../../../modules/rds"

  #################################################
  # ENVIRONMENT
  #################################################

  environment = var.environment

  #################################################
  # NETWORKING
  #################################################

  vpc_id = data.terraform_remote_state.network.outputs.vpc_id

  vpc_cidr = var.vpc_cidr

  private_subnet_ids = data.terraform_remote_state.network.outputs.private_subnet_ids

  #################################################
  # DATABASE
  #################################################

  db_name = var.db_name

  db_username = var.db_username

  db_password = var.db_password
}