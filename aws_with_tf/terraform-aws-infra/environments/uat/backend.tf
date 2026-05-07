terraform {
  backend "s3" {
    bucket       = "gaurav-prod-teeraform-state-bucket-074095961179"
    key          = "infra/network/vpc/uat/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = false
  }
}