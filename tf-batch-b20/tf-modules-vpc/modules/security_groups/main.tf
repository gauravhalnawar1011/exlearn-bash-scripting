locals {

  common_tags = {

    Environment = var.environment

    ManagedBy = var.managed_by

    Project = var.project_name
  }
}



resource "aws_security_group" "aws_tf_sg" {
  name        = "${var.environment}-sg-exlearn"
  description = "Day01 terraofrm security groups"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.environment}-sg-exlearn"
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = "network"
  }
}

