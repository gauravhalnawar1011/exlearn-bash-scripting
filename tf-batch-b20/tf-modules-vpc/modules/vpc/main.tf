locals {

  common_tags = {

    Environment = var.environment

    ManagedBy = var.managed_by

    Project = var.project_name
  }
}


resource "aws_vpc" "main" {

  cidr_block = var.vpc_cidr

  enable_dns_support = true

  enable_dns_hostnames = true

  tags = merge(

    local.common_tags,

    {
      Name = "${var.environment}-vpc"
    }
  )
}

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




resource "aws_subnet" "private" {
  count = length(var.private_subnets)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnets[count.index]
  availability_zone       = var.availability_zones[count.index]

  tags = {
    Name = "${var.environment}-private-subnet-${count.index + 1}"

    Environment = var.environment
    Type        = "private"
    ManagedBy   = "Terraform"

    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.igw_name

  }
}



resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Name = var.public_rt_name
  }
}




resource "aws_route_table_association" "public_rt_association" {
  count = length(var.public_subnets)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_rt.id

  
}


resource "aws_route_table" "private" {

  vpc_id = aws_vpc.main.id


  tags = {
    Name        = "${var.environment}-private-rt"
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = "network"
  }
}

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

resource "aws_nat_gateway" "nat_ap_south_1a" {

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


resource "aws_route" "private_nat" {

  route_table_id = aws_route_table.private.id

  destination_cidr_block = "0.0.0.0/0"

  nat_gateway_id = aws_nat_gateway.nat_ap_south_1a.id
}