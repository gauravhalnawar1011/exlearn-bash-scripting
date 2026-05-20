output "rds_endpoint" {

  value = module.rds.rds_endpoint
}

output "rds_address" {

  value = module.rds.rds_address
}

output "rds_port" {

  value = module.rds.rds_port
}

output "rds_security_group_id" {

  value = module.rds.rds_security_group_id
}

output "db_subnet_group" {

  value = module.rds.db_subnet_group
}