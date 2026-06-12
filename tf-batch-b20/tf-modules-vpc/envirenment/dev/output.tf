# output "vpc_id" {

#   value = module.vpc.vpc_id
# }


output "vpc_id" {
  value = module.aws_vpc.vpc_id
}


output "security_groups" {
  value = module.security_groups.security_group_id
}
output "instance_id" {
  value = module.aws_ec2.instance_id
}

output "public_ip" {
  value = module.aws_ec2.public_ip
}

output "private_ip" {
  value = module.aws_ec2.private_ip
}