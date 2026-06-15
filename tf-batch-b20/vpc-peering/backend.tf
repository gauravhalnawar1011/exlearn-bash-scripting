terraform {
  backend "s3" {
    bucket = "tf-state-b-20-exlearn-s3-backend"
    key    = "networking/vpc/vpc-peering/terraform.tfstate"
    region = "ap-south-1"
  }
}
