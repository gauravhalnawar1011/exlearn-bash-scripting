# output "vpc_id" {

#   value = module.vpc.vpc_id
# }


output "vpc_id" {
  value = module.aws_vpc.vpc_id
}