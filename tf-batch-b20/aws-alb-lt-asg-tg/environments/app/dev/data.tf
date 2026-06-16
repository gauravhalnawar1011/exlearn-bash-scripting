#################################################
# REMOTE STATE - NETWORK
#################################################

data "terraform_remote_state" "network" {

  backend = "s3"

  config = {
    bucket = "tf-state-b-20-exlearn-s3-backend"
    key    = "network/ALB/terraform.tfstate"
    region = "ap-south-1"
  }
}