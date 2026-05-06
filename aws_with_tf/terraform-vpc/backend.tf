terraform {
  required_version = ">= 1.6"

  backend "s3" {
    bucket       = "gaurav-prod-terraform-state-bucket-074095961179"
    key          = "infra/network/vpc.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = false
  }
}