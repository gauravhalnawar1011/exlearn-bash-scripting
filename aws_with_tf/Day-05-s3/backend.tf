terraform {
  backend "s3" {
    bucket = "gaurav-prod-teeraform-state-bucket-074095961179"
    key    = "storage/s3/terraform.tfstate"
    region = "ap-south-1"
    use_lockfile = false

  }
}

