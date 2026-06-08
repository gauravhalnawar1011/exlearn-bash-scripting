resource "aws_instance" "tf_instace_day_02" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  key_name = var.key_name
  security_groups = [aws_security_group.aws_tf_sg.id]
  count = var.instance_count

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
    Name = var.instance_tag
    env = ""
  }
}