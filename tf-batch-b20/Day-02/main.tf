resource "aws_security_group" "aws_tf_sg" {
  name        = "aws security group tf"
  description = "Day01 terraofrm security groups"
  vpc_id      = "vpc-03c989e04fab66a5e"

  tags = {
    Name = "tf-Day-01-sg"
    env = "dev"
  }
}




