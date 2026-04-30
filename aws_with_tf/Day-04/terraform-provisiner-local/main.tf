provider "aws" {
  region = "ap-south-1"
}

# --- Security Group ---
resource "aws_security_group" "main" {
  name        = "main-sg"
  description = "Allow SSH and all outbound traffic"

  ingress = [
    {
      description      = "Allow SSH"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress = [
    {
      description      = "Allow all outbound traffic"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
}

# --- EC2 Instance ---
resource "aws_instance" "example" {
  ami                         = "ami-02d26659fd82cf299"
  instance_type               = "t3.micro"
  vpc_security_group_ids      = [aws_security_group.main.id]
  associate_public_ip_address = true

  # Local-exec provisioner (runs locally)
  provisioner "local-exec" {
    command = "echo The instance ${self.public_ip} is now running >> instance_info.txt"
  }

  tags = {
    Name = "local-exec-demo"
  }
}