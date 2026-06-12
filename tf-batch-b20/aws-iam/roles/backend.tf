terraform {
  backend "s3" {
    bucket = "tf-state-b-20-exlearn-s3-backend"
    key    = "aws/iam/roles/terraform.tfstate"
    region = "ap-south-1"
  }
}
