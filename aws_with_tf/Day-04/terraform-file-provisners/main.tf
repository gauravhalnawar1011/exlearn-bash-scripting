provider "aws" {
   region     = "ap-south-1"

}

resource "aws_instance" "ec2_example" {

    ami = "ami-02d26659fd82cf299"  
    instance_type = "t3.micro" 
    key_name= "ssh"
    vpc_security_group_ids = [aws_security_group.main.id]

  provisioner "file" {
    source      = "/home/gaurav-h/Downloads/Akami.pdf"
    destination = "/home/ubuntu/Akami.pdf"
  }
  connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("/home/gaurav-h/projects/CKA-Piyush-Sachdeva/aws_with_terraform/Day-06/terraform-file-provisners/ssh")
      timeout     = "4m"
   }
}

resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
  }
  ]
}

resource "aws_key_pair" "ssh" {
  key_name   = "ssh"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+viD3GuABT9SeMfnfmT0ZBLcL32QTWq2CN09grNvj/YwoKTAS3LP9gEt2kl1suww4EkmHji3nwC3slSHNG/UFIg+oPS7g0gcixGztnNi8LZ7JsjlpygQsLseAzUd32+x89hRYSwgCOzyREImlWoH25icvhjsXsdUJR4v6QD2aq1BEPSxgRA1avlZsPpNLNDe2Hx6C/LJd0va6ua5BJo0lO/AQkGGncTH9/Z9X4/V1CW5JhTrd7Ykl/o6y6++DdZMN6y3nH0jkfxPwoqfzre0V1iHVBwc/HWz6KabGvWWmFCcKXiE0fyY6+vnWCjfwd742hWwFMSnBFia7n5Ok0UjL gaurav-h@ubuntu"

}