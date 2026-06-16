#################################################
# NETWORK REMOTE STATE
#################################################

data "terraform_remote_state" "network" {

  backend = "s3"

  config = {

    bucket = "tf-state-b-20-exlearn-s3-backend"
    key    = "network/vpc/endpoints-demo/terraform.tfstate"
    region = "ap-south-1"
  }
}