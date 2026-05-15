output "vpc_id" {
  value = module.vpc_stack.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc_stack.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc_stack.private_subnet_ids
}