terraform {
  backend "s3" {
    bucket = "gaurav-prod-teeraform-state-bucket-074095961179"
    key    = "ec2/kubeadm/terraform.tfstate"
    region = "ap-south-1"
    use_lockfile = false

  }
}


