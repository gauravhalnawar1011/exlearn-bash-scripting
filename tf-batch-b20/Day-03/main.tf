# resource "aws_security_group" "aws_tf_sg" {
#   name        = "aws security group tf"
#   description = "Day01 terraofrm security groups"
#   vpc_id      = "vpc-03c989e04fab66a5e"

#   tags = {
#     Name = "tf-Day-01-sg"
#     env = "dev"
#   }
# }




# resource "aws_s3_bucket" "example" {
#   bucket = var.bucket_name

#   tags = {
#     Name        = var.tag_name
#     Environment = var.env
#   }
# }




resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
    env = var.env
  }
}