resource "aws_security_group" "aws_tf_sg" {
  name        = "aws security group tf"
  description = "Day01 terraofrm security groups"
  vpc_id      = "vpc-06dfddcfc6878ceba"

  tags = {
    Name = "tf-Day-01-sg"
    env = "dev"
  }
}




