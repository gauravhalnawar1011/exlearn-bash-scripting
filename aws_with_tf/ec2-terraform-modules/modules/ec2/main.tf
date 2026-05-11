resource "aws_instance" "example" {
  ami           = var.ec2_ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  key_name = var.key_name
  security_groups = var.security_group


  tags = {
    Name = "${var.environment}-tf-module"
  }
}
