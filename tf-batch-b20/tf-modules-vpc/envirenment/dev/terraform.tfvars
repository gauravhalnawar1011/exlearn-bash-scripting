environment = "dev-exlearn"
managed_by = "devops-team"
project_name = "aws-vpc-infra"
vpc_cidr = "10.0.0.0/16"
aws_region = "ap-south-1"

availability_zones = [
  "ap-south-1a",
  "ap-south-1b",
  "ap-south-1c"
]

public_subnets = [
  "10.0.1.0/24",
  "10.0.2.0/24",
  "10.0.3.0/24"
]

private_subnets = [
  "10.0.11.0/24",
  "10.0.12.0/24",
  "10.0.13.0/24"
]

igw_name = "exlearn-igw"
public_rt_name = "exlearn-public-rt"