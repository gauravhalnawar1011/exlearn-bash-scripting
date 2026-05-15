terraform {
  backend "s3" {
    bucket       = "gaurav-prod-teeraform-state-bucket-074095961179"
    key          = "compute/infra/ec2/dev/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = false
  }
}