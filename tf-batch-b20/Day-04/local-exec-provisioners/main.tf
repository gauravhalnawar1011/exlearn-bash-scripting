
resource "aws_key_pair" "ssh-key-file" {
  key_name   = "ssh-key-file"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHGqMdEYQSfM5f8SzFXV4wt1ku5S31EED57EmXyTgFTV gaurav-h@ubuntu"
}




resource "aws_instance" "example" {
  ami           =  var.ami_id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  key_name = aws_key_pair.ssh-key-file.key_name
  associate_public_ip_address = var.associate_public_ip_address
  security_groups = [aws_security_group.aws_tf_sg.id]

  

connection {
  type = "ssh"
 host = self.public_ip
 user = "ubuntu"
private_key = file("/home/gaurav-h/exlearn/exlearn-bash-scripting/tf-batch-b20/Day-04/file-provisioners/ssh-key")
timeout = "3m"
}
# provisioner "file" {
#   source = "/home/gaurav-h/exlearn/exlearn-bash-scripting/tf-batch-b20/Day-04/file-provisioners/demo.txt"
#   destination = "/home/ubuntu/demo.txt"
  
# }

provisioner "remote-exec" {
        inline = [
      "sudo apt update -y",
      "sudo apt install -y nginx",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx",
      "echo 'Hello from Terraform remote-exec!' | sudo tee /var/www/html/index.html",
      "sudo apt install git -y ",
          "echo 'Git version on instance:'",
      "git --version",
        ]


}


provisioner "local-exec" {
  command = "echo ${self.public_ip}: $(git --version)  >> instance_info.txt"
  

  
}



  tags = {
    Name = var.instance_name
  }
}