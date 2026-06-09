terraform {
  backend "s3" {
    bucket = "tf-state-b-20-exlearn-s3-backend"
    key    = "compute/Day-04/remote-provisioners/terraform.tfstate"
    region = "ap-south-1"
  }
}
