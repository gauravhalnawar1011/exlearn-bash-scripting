#################################################
# ALB
#################################################

output "alb_dns_name" {

  value = module.alb.alb_dns_name
}

#################################################
# ASG
#################################################

output "asg_name" {

  value = module.asg.asg_name
}

#################################################
# TARGET GROUP
#################################################

output "target_group_arn" {

  value = module.target_group.target_group_arn
}

#################################################
# LAUNCH TEMPLATE
#################################################

output "launch_template_id" {

  value = module.launch_template.launch_template_id
}

#################################################
# SECURITY GROUPS
#################################################

output "alb_security_group_id" {

  value = module.security_group.alb_security_group_id
}

output "ec2_security_group_id" {

  value = module.security_group.ec2_security_group_id
}

# output "application_url" {

#   value = module.dns.record_name
# }