#################################################
# REMOTE STATE - NETWORK
#################################################

data "terraform_remote_state" "network" {

  backend = "s3"

  config = {
    bucket = "gaurav-prod-teeraform-state-bucket-074095961179"
    key = "infra/network/dev/terraform.tfstate"
    region = "ap-south-1"
  }
}