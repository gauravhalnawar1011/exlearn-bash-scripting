#################################################
# PUBLIC NACL
#################################################

resource "aws_network_acl" "public_nacl" {

  vpc_id = aws_vpc.main.id

  subnet_ids = aws_subnet.public[*].id

  tags = {

    Name = "${var.environment}-public-nacl"

    Environment = var.environment

    ManagedBy = "Terraform"

    Type = "public"
  }
}

#################################################
# PUBLIC INBOUND RULES
#################################################

# HTTP

resource "aws_network_acl_rule" "public_http_inbound" {

  network_acl_id = aws_network_acl.public_nacl.id

  rule_number = 100

  egress = false

  protocol = "tcp"

  rule_action = "allow"

  cidr_block = "0.0.0.0/0"

  from_port = 80

  to_port = 80
}

# HTTPS

resource "aws_network_acl_rule" "public_https_inbound" {

  network_acl_id = aws_network_acl.public_nacl.id

  rule_number = 110

  egress = false

  protocol = "tcp"

  rule_action = "allow"

  cidr_block = "0.0.0.0/0"

  from_port = 443

  to_port = 443
}

# SSH

resource "aws_network_acl_rule" "public_ssh_inbound" {

  network_acl_id = aws_network_acl.public_nacl.id

  rule_number = 120

  egress = false

  protocol = "tcp"

  rule_action = "allow"

  cidr_block = "0.0.0.0/0"

  from_port = 22

  to_port = 22
}

# Ephemeral Ports

resource "aws_network_acl_rule" "public_ephemeral_inbound" {

  network_acl_id = aws_network_acl.public_nacl.id

  rule_number = 130

  egress = false

  protocol = "tcp"

  rule_action = "allow"

  cidr_block = "0.0.0.0/0"

  from_port = 1024

  to_port = 65535
}

#################################################
# PUBLIC OUTBOUND RULES
#################################################

resource "aws_network_acl_rule" "public_all_outbound" {

  network_acl_id = aws_network_acl.public_nacl.id

  rule_number = 100

  egress = true

  protocol = "-1"

  rule_action = "allow"

  cidr_block = "0.0.0.0/0"

  from_port = 0

  to_port = 0
}

#################################################
# PRIVATE NACL
#################################################

resource "aws_network_acl" "private_nacl" {

  vpc_id = aws_vpc.main.id

  subnet_ids = aws_subnet.private[*].id

  tags = {

    Name = "${var.environment}-private-nacl"

    Environment = var.environment

    ManagedBy = "Terraform"

    Type = "private"
  }
}

#################################################
# PRIVATE INBOUND RULES
#################################################

# MySQL Access

resource "aws_network_acl_rule" "private_mysql_inbound" {

  network_acl_id = aws_network_acl.private_nacl.id

  rule_number = 100

  egress = false

  protocol = "tcp"

  rule_action = "allow"

  cidr_block = var.vpc_cidr

  from_port = 3306

  to_port = 3306
}

# Ephemeral Ports

resource "aws_network_acl_rule" "private_ephemeral_inbound" {

  network_acl_id = aws_network_acl.private_nacl.id

  rule_number = 110

  egress = false

  protocol = "tcp"

  rule_action = "allow"

  cidr_block = var.vpc_cidr

  from_port = 1024

  to_port = 65535
}

#################################################
# PRIVATE OUTBOUND RULES
#################################################

resource "aws_network_acl_rule" "private_all_outbound" {

  network_acl_id = aws_network_acl.private_nacl.id

  rule_number = 100

  egress = true

  protocol = "-1"

  rule_action = "allow"

  cidr_block = "0.0.0.0/0"

  from_port = 0

  to_port = 0
}


# BEST DEMO YOU CAN SHOW
# Step 1

# RDS works.

# Step 2

# Remove:

# private_ephemeral_inbound

# DB connectivity breaks.

# Step 3

# Explain:

# NACLs are stateless

# This becomes memorable networking education instead of rote memorization.

# Another Important Production Reality

# In REAL production:

# SGs handle most filtering
# NACLs are usually coarse-grained

# Because:

# NACL management becomes difficult at scale

# That’s a genuinely valuable real-world insight to teach students.