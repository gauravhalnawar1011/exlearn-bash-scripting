#################################################
# AMAZON LINUX 2023
#################################################

#################################################
# AMAZON LINUX 2023
#################################################

data "aws_ami" "amazon_linux" {

  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

#################################################
# EC2
#################################################

resource "aws_instance" "docker_server" {

  ami = data.aws_ami.amazon_linux.id

  instance_type = "t3.micro"

  subnet_id = aws_subnet.public.id

  key_name = "peering-demo"

  vpc_security_group_ids = [

    aws_security_group.ec2_sg.id
  ]

  user_data = <<-EOF
#!/bin/bash

dnf update -y

#################################################
# INSTALL DOCKER
#################################################

dnf install -y docker

#################################################
# START DOCKER
#################################################

systemctl enable docker

systemctl start docker

#################################################
# ADD EC2 USER
#################################################

usermod -aG docker ec2-user
sudo usermod -aG docker ec2-user

newgrp docker

EOF

  tags = {

    Name = "docker-server"
  }
}