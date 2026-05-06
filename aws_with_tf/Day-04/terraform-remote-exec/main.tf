provider "aws" {
  region = "ap-south-1"
}


# --- Key Pair ---
resource "aws_key_pair" "ec2-ssh" {
  key_name   = "ec2-ssh"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDqI5lFcUsf1d6Ra4W91/WnpVnFVPQOmxlA5n5nLKV8F5w9YXr/NGL9y4vr9iXVVPOkjhcqICwbyqV8zaPGY+ZsoFy2XfnKMpKn20CMO0QMvB0u/uv+RlAwEdtzJk3XW4FGZdbFJGI+SFWqYbRKBZ0PRINQ2bFVpN5P+vYqheEgvVp/ElN+SLygeb4IydGdmDSnLKqgDm/KKFILMdWIg6txocAVlgBphDeESatKyOKbbey6o6C1tBXZw32VSypigAuxKL7T3DtMxDYQDhpC0SIO0ew14ag63hfRkivZvCFH0ccY59x0MED7Y8hgRjbKIdWGwtoLHAc6bHiW0XfOJCt5i3O6xm4xYgUiQ5q58fsQvlRMIjJXZolj3SXI96i6iQiNfe5YEZJktHjVvY6AaocIv1iOGt36v8UOPD+jIT0+aCid4i5sg/Oo7MZbPBO6mEl7dceG3fr3jai/2kAQW01Xs/TI3CTjgLocEvXWReCpN33xwKmXzbpFF74oJ5mVkKqOuaGb7IyQ+Wx30n6EomgMP+nSql6MWXb9cZcfzLDCzS+hPMJ2WhpzFMYfcPOyZ8F7pF2vpSw/7p+wexhO5flOtin9K3r/6RHvHP9E+8r2OIx8AuB/vsTe7S2i+uH7HjYNdHAfFG/csmkUSzpqIhGif9TYxDlqv/UsMJ+jF9/aPQ== gaurav-h@ubuntu"

}
# --- EC2 Instance ---
resource "aws_instance" "example" {
  ami                         = "ami-02d26659fd82cf299"
  instance_type               = "t3.micro"
  key_name                    = "ec2-ssh"
  subnet_id = "subnet-0f997207af9a98f20"
  security_groups = ["sg-002c43a0f53539f91"]
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
      private_key = file("/home/gaurav-h/exlearn/exlearn-bash-scripting/aws_with_tf/Day-04/keys/ec2-ssh")
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