#################################################
# REMOTE STATE - VPC
#################################################

data "terraform_remote_state" "network" {

  backend = "s3"

  config = {

    bucket       = "gaurav-prod-teeraform-state-bucket-074095961179"
    key          = "network/vpc/rds/dev/terraform.tfstate"
    region       = "ap-south-1"

  }
}