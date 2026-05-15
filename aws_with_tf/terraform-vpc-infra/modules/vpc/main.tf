#VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.environment}-vpc"
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = "network"
  }
}

#IGW
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.environment}-igw"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

#PUBLIC RT
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name        = "${var.environment}-public-rt"
    Environment = var.environment
  }
}

#PRIVATE RT
resource "aws_route_table" "private" {

  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name        = "${var.environment}-private-rt"
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = "network"
  }
}



#PUBLIC SUBNETS

resource "aws_subnet" "public" {
  count = length(var.public_subnets)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnets[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment}-public-subnet-${count.index + 1}"

    Environment = var.environment
    Type        = "public"
    ManagedBy   = "Terraform"

    "kubernetes.io/role/elb" = "1"
  }
}


#PRIVATE SUBNETS
resource "aws_subnet" "private" {
  count = length(var.private_subnets)

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = var.availability_zones[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.environment}-private-subnet-${count.index + 1}"

    Environment = var.environment
    Type        = "private"
    ManagedBy   = "Terraform"

    "kubernetes.io/role/internal-elb" = "1"
  }
}

#Route Table Association (Public)

resource "aws_route_table_association" "public_assoc" {
  count = length(var.public_subnets)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}


#Route Table Association (Private)
resource "aws_route_table_association" "private_assoc" {
  count = length(var.private_subnets)

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}


#Elastic IP for NAT Gateway

resource "aws_eip" "nat_eip" {

  domain = "vpc"

  depends_on = [
    aws_internet_gateway.gw
  ]

  tags = {
    Name        = "${var.environment}-nat-eip"
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = "network"
  }
}

#NAT Gateway

resource "aws_nat_gateway" "nat" {

  allocation_id = aws_eip.nat_eip.id

  subnet_id = aws_subnet.public[0].id

  depends_on = [
    aws_internet_gateway.gw
  ]

  tags = {
    Name        = "${var.environment}-nat-gateway"
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = "network"
  }
}