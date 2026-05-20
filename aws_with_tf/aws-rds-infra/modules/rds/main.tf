#################################################
# DB SUBNET GROUP
#################################################

resource "aws_db_subnet_group" "main" {

  name = "${var.environment}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {

    Name        = "${var.environment}-db-subnet-group"

    Environment = var.environment

    ManagedBy   = "Terraform"

    Project     = "rds"
  }
}

#################################################
# RDS SECURITY GROUP
#################################################

resource "aws_security_group" "rds_sg" {

  name = "${var.environment}-rds-sg"

  description = "Security group for RDS MySQL"

  vpc_id = var.vpc_id

  #################################################
  # MYSQL ACCESS
  #################################################

  ingress {

    description = "MySQL access from application subnet"

    from_port = 3306

    to_port = 3306

    protocol = "tcp"

    cidr_blocks = [var.vpc_cidr]
  }

  #################################################
  # OUTBOUND
  #################################################

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {

    Name        = "${var.environment}-rds-sg"

    Environment = var.environment

    ManagedBy   = "Terraform"

    Project     = "rds"
  }
}

#################################################
# RDS INSTANCE
#################################################

resource "aws_db_instance" "mysql" {

  identifier = "${var.environment}-mysql-rds"

  allocated_storage = 20

  max_allocated_storage = 100

  storage_type = "gp2"

  storage_encrypted = true
 engine = "mariadb"

engine_version = "10.11"

  instance_class = "db.t4g.micro"

  db_name = var.db_name

  username = var.db_username

  password = var.db_password

  port = 3306

  publicly_accessible = false

  multi_az = false

  skip_final_snapshot = true

  deletion_protection = false

  backup_retention_period = 0

  backup_window = "03:00-04:00"

  maintenance_window = "sun:04:00-sun:05:00"

  auto_minor_version_upgrade = true

  performance_insights_enabled = false

  db_subnet_group_name = aws_db_subnet_group.main.name

  vpc_security_group_ids = [
    aws_security_group.rds_sg.id
  ]

  tags = {

    Name        = "${var.environment}-mysql-rds"

    Environment = var.environment

    ManagedBy   = "Terraform"

    Project     = "rds"
  }
}