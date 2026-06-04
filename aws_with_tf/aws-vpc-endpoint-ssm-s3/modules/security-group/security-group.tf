#################################################
# LOCAL TAGS
#################################################

locals {

  common_tags = {

    Environment = var.environment

    ManagedBy = "Terraform"

    Project = var.project_name
  }
}

#################################################
# EC2 SECURITY GROUP
#################################################

resource "aws_security_group" "ec2" {

  name = "${var.environment}-private-ec2-sg"

  description = "Private EC2 Security Group"

  vpc_id = var.vpc_id

  #################################################
  # NO INBOUND RULES
  #################################################

  #################################################
  # HTTPS TO VPC ENDPOINTS
  #################################################

  egress {

    description = "HTTPS to VPC Endpoints"

    from_port = 443

    to_port = 443

    protocol = "tcp"

    cidr_blocks = [var.vpc_cidr]
  }

  tags = merge(

    local.common_tags,

    {

      Name = "${var.environment}-private-ec2-sg"
    }
  )
}

