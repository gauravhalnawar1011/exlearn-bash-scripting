terraform {
  backend "s3" {
    bucket = "gaurav-prod-teeraform-state-bucket-074095961179"
    key    = "Security_Identity_Compliance/IAM/groups/terraform.tfstate"
    region = "ap-south-1"
    use_lockfile = false

  }
}

