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

  ami           = data.aws_ami.amazon_linux.id
  instance_type = "m7i-flex.large"

  subnet_id = aws_subnet.public.id

  key_name = "peering-demo"

iam_instance_profile = aws_iam_instance_profile.jenkins_profile.name
  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]
  user_data = file("user_data.sh")

  tags = {
    Name = "jenkins-server"
  }
}
