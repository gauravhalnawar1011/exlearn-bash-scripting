
#################################################
# EC2 SECURITY GROUP
#################################################

resource "aws_security_group" "ec2_sg" {

  name = "${var.environment}-ec2-sg"

  description = "Security group for Bastion EC2"

  vpc_id = data.terraform_remote_state.network.outputs.vpc_id

  #################################################
  # SSH
  #################################################

  ingress {

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  #################################################
  # HTTP
  #################################################

  ingress {

    from_port = 80

    to_port = 80

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  #################################################
  # OUTBOUND
  #################################################

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {

    Name = "${var.environment}-ec2-sg"

    Environment = var.environment

    ManagedBy = "Terraform"
  }
}

#################################################
# EC2 INSTANCE
#################################################

resource "aws_instance" "bastion" {

  ami = "ami-09ed39e30153c3bf9"

  instance_type = "t3.micro"

  subnet_id = data.terraform_remote_state.network.outputs.public_subnet_ids[0]

  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  associate_public_ip_address = true

  key_name = var.key_name

  user_data = <<-EOF
              #!/bin/bash

              yum update -y

              yum install mariadb105 -y
              EOF

  tags = {

    Name = "${var.environment}-bastion-server"

    Environment = var.environment

    ManagedBy = "Terraform"
  }
}


# to connect from the ec2 to rds use  : mysql -h <rds_endpoint> -P 3306 -u admin -p