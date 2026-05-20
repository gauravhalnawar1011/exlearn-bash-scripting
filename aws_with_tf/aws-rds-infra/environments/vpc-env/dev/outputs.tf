output "vpc_id" {

  value = module.rds_vpc.vpc_id
}

output "public_subnet_ids" {

  value = module.rds_vpc.public_subnet_ids
}

output "private_subnet_ids" {

  value = module.rds_vpc.private_subnet_ids
}

output "internet_gateway_id" {

  value = module.rds_vpc.internet_gateway_id
}

output "nat_gateway_id" {

  value = module.rds_vpc.nat_gateway_id
}