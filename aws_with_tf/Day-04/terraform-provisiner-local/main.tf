provider "aws" {
  region = "ap-south-1"
}

# --- Security Group ---

# --- EC2 Instance ---
resource "aws_instance" "example" {
  ami                         = "ami-07a00cf47dbbc844c"
  instance_type               = "t3.micro"
  security_groups = ["sg-002c43a0f53539f91"]
  subnet_id = "subnet-0f997207af9a98f20"
  associate_public_ip_address = true

  # Local-exec provisioner (runs locally)
  provisioner "local-exec" {
    command = "echo The instance ${self.public_ip} is now running >> instance_info.txt"
  }

  tags = {
    Name = "local-exec-demo"
  }
}