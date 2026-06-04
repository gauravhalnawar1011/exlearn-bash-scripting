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


output "public_ip" {
  value = aws_instance.example.public_ip
}