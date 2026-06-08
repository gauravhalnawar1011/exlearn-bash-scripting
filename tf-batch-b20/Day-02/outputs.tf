output "sg_id" {
  description = "this for the aws sg id in local"
  value = aws_security_group.aws_tf_sg.id
}

output "https_rule_id" {
  value = aws_vpc_security_group_ingress_rule.allow_tls_ipv4.id
}


output "ssh_from_internet" {
  
  value = aws_vpc_security_group_ingress_rule.ssh_from_internet.id
}


output "public_ips" {
  
  value = [
    for instance in aws_instance.tf_instace_day_02 : instance.public_ip
  ]
}

output "ec2_public_ip1" {
  value = aws_instance.tf_instace_day_02[0].public_ip
}
output "ec2_public_ip2" {
  value = aws_instance.tf_instace_day_02[1].public_ip
}
output "ec2_public_ip3" {
  value = aws_instance.tf_instace_day_02[2].public_ip
}