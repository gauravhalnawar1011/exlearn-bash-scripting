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
  },
  {
    description      = "Allow HTTP"
    from_port        = 80
    to_port          = 80
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

# --- Key Pair ---
resource "aws_key_pair" "example_key" {
  key_name   = "example-key"
  public_key = file("/home/gaurav-h/projects/CKA-Piyush-Sachdeva/aws_with_terraform/Day-06/ssh.pub")
}

# --- EC2 Instance ---
resource "aws_instance" "example" {
  ami                         = "ami-02d26659fd82cf299"
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.example_key.key_name
  vpc_security_group_ids      = [aws_security_group.main.id]
  associate_public_ip_address = true

  # Remote-exec provisioner (runs commands on the EC2 instance)
  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y nginx",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx",
      "echo 'Hello from Terraform remote-exec!' | sudo tee /var/www/html/index.html"
    ]

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("/home/gaurav-h/projects/CKA-Piyush-Sachdeva/aws_with_terraform/Day-06/ssh")
      timeout     = "5m"
    }
  }

  tags = {
    Name = "remote-exec-demo"
  }
}

output "public_ip" {
    value = aws_instance.example.public_ip
  
}