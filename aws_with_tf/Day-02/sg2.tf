resource "aws_security_group" "tf-sg2" {
    name = "tf-sg2"
    description = "this first sg using tf"
    vpc_id = "vpc-086ca82e6bbdad5b9"
    
  tags = {
    Name = "tf-sg2-day3"
  }
  

  ingress {
    description = "this for the ssh acces"
    from_port = "22"
    to_port = "22"
    protocol = "tcp"
    cidr_blocks = ["103.123.48.148/32"]
    ipv6_cidr_blocks = ["::/0"]

  }

 ingress {
    description = "this for the Http acces"
    from_port = "80"
    to_port = "80"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}

