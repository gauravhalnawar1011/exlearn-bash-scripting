module "ec2-stack" {
  source = "../../modules/s3"


 enviroments = var.enviroments
 bucket = var.bucket

  }





