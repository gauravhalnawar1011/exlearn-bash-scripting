output "public_ip" {
    description = "this for the aws ec2 public ip"
    value = aws_instance.example.public_ip

}


output "private_ip" {
    description = "this for the aws ec2 public ip"
    value = aws_instance.example.private_ip
  
}

output "private_dns" {
    description = "this for the aws ec2 public ip"
    value = aws_instance.example.private_dns
  
}

output "public_dns" {
    description = "this for the aws ec2 public ip"
    value = aws_instance.example.public_dns

}
