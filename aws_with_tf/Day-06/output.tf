output "vpc_id" {
    value = aws_vpc.main.id
  
}

output "igw_id" {
    value = aws_internet_gateway.without-vpc-gw.id
  
}

output "public-rt" {
    value = aws_route_table.public-rt.id
  
}

output "private-rt" {
    value = aws_route_table.private-rt.id
  
}

output "public-ip" {
  
  value = aws_instance.example.public_ip
}