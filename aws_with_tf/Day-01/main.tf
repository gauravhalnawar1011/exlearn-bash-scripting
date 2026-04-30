
resource "aws_instance" "example" {
  ami           =  var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = var.subnet_id
  security_groups = ["sg-0460954b62e7fc9c4"]

  
  provisioner "file" {
    source      = "/home/gaurav-h/exlearn/website/index.html"
    destination = "/home/ubuntu/index.html"
  }
  connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("/home/gaurav-h/Downloads/peering-demo.pem")
      timeout     = "8m"
   }


  user_data = <<-EOT
    #!/bin/bash
    apt update -y
    apt install -y nginx
    systemctl start nginx
    systemctl enable nginx
    # We even use the Terraform variable inside the server!
    echo "<h1>Hello from Terraform Locals Demo  environment)</h1>" > /var/www/html/index.html
EOT

  tags = {
    Name = var.instance_name
  }
}

