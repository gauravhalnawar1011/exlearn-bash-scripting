locals {

  common_tags = {

    Environment = var.environment

    ManagedBy = var.managed_by

    Project = var.project_name
  }
}


resource "aws_instance" "example" {
  ami           =  var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = var.subnet_id
  security_groups = var.security_groups

  tags = {
    Name = var.instance_name
  }
}
