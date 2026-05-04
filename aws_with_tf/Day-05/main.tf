



resource "aws_instance" "example" {
  ami           =  var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = var.subnet_id
  security_groups = ["sg-002c43a0f53539f91"]




  tags = {
    Name = var.instance_name
  }
}

