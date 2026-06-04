#################################################
# PUBLIC NACL
#################################################

resource "aws_network_acl" "public" {

  vpc_id = aws_vpc.main.id

  subnet_ids = aws_subnet.public[*].id

  #################################################
  # INBOUND HTTP
  #################################################

  ingress {

    rule_no = 100

    protocol = "tcp"

    action = "allow"

    cidr_block = "0.0.0.0/0"

    from_port = 80

    to_port = 80
  }

  #################################################
  # INBOUND HTTPS
  #################################################

  ingress {

    rule_no = 110

    protocol = "tcp"

    action = "allow"

    cidr_block = "0.0.0.0/0"

    from_port = 443

    to_port = 443
  }

  #################################################
  # SSH (Optional)
  #################################################

  ingress {

    rule_no = 120

    protocol = "tcp"

    action = "allow"

    cidr_block = "0.0.0.0/0"

    from_port = 22

    to_port = 22
  }

  #################################################
  # EPHEMERAL PORTS
  #################################################

  ingress {

    rule_no = 130

    protocol = "tcp"

    action = "allow"

    cidr_block = "0.0.0.0/0"

    from_port = 1024

    to_port = 65535
  }

  #################################################
  # OUTBOUND ALL
  #################################################

  egress {

    rule_no = 100

    protocol = "-1"

    action = "allow"

    cidr_block = "0.0.0.0/0"

    from_port = 0

    to_port = 0
  }

  tags = {

    Name = "${var.environment}-public-nacl"
  }
}

#################################################
# PRIVATE NACL
#################################################

resource "aws_network_acl" "private" {

  vpc_id = aws_vpc.main.id

  subnet_ids = aws_subnet.private[*].id

  #################################################
  # HTTPS FROM VPC
  # SSM + VPC ENDPOINTS
  #################################################

  ingress {

    rule_no = 100

    protocol = "tcp"

    action = "allow"

    cidr_block = var.vpc_cidr

    from_port = 443

    to_port = 443
  }

  #################################################
  # EPHEMERAL RESPONSE PORTS
  #################################################

  ingress {

    rule_no = 110

    protocol = "tcp"

    action = "allow"

    cidr_block = var.vpc_cidr

    from_port = 1024

    to_port = 65535
  }

  #################################################
  # OUTBOUND HTTPS
  #################################################

  egress {

    rule_no = 100

    protocol = "tcp"

    action = "allow"

    cidr_block = var.vpc_cidr

    from_port = 443

    to_port = 443
  }

  #################################################
  # OUTBOUND EPHEMERAL
  #################################################

  egress {

    rule_no = 110

    protocol = "tcp"

    action = "allow"

    cidr_block = var.vpc_cidr

    from_port = 1024

    to_port = 65535
  }

  tags = {

    Name = "${var.environment}-private-nacl"
  }
}