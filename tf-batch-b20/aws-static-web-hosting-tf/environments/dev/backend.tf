terraform {
  backend "s3" {
    bucket = "tf-state-b-20-exlearn-s3-backend"
    key    = "storage/s3/static-web-hosting/terraform.tfstate"
    region = "ap-south-1"
  }
}
