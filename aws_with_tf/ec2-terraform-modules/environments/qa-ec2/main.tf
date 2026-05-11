module "ec2-stack" {
  source = "../../modules/ec2"

  ec2_ami     = var.ec2_ami
  subnet_id  = var.subnet_id
  key_name = var.key_name
  security_group = [var.security_group]
  instance_type = var.instance_type
  environment = var.environment


  }





