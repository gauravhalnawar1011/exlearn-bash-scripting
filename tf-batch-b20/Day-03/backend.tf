terraform {
  backend "s3" {
    bucket = "tf-state-b-20-exlearn-s3-backend"
    key    = "storage/dev/workspaces/Day-03/terraform.tfstate"
    region = "ap-south-1"
  }
}
