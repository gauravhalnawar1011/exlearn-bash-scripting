locals {

  common_tags = {

    Environment = var.environment

    ManagedBy = var.managed_by

    Project = var.project_name
  }
}


resource "aws_instance" "example" {

  ami           = var.ami_id
  instance_type = var.instance_type

  key_name = var.key_name

  subnet_id = var.subnet_id

  vpc_security_group_ids = var.security_group_ids

  tags = merge(
    local.common_tags,
    {
      Name = var.instance_name
    }
  )
}