output "rds_endpoint" {

  value = aws_db_instance.mysql.endpoint
}

output "rds_address" {

  value = aws_db_instance.mysql.address
}

output "rds_port" {

  value = aws_db_instance.mysql.port
}

output "rds_arn" {

  value = aws_db_instance.mysql.arn
}

output "rds_security_group_id" {

  value = aws_security_group.rds_sg.id
}

output "db_subnet_group" {

  value = aws_db_subnet_group.main.name
}