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
# rdp_port = 3389


ami_id = "ami-0db56f446d44f2f09"
instance_type = "c7i-flex.large"
key_name = "peering-demo"
instance_name = "tf-exlearn-cutom-vpc"
