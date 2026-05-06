provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_key_pair" "exleran" {
  key_name   = "exleran-ssh"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDM4pP9QxAynpja0Sn8rV3iNLF3wGLYD3b2H+SoCnyq8kSauJyb9UFHYBmeUsbGMeni/0aMqZ4aqPe/l/2L5Am3Qiy+zMglEcAKq9eYg34xUBzxdkK8H+al8UB21XaAMjXVKSmjK1g6D5SCtVhd2xyAORcyms5/nfJV1/4BhPtcl9dyz47BOWygLoK7Yt8xi8xNqL4GJW2BDGPWkA0YTYHSXN5faW8ykgw/C+VgoBeEGRBuokn2GIICVrpWpeJhUKKvsg7zDHv15zo3cBgw5rlM9/3ur9TcKqeZF58N8Cs51mmUz8ogczVPzahXiji+cgk6dDVkOKxD741n9bkBRtcU6RVssg7LK4By/OOcQ44UmssVrqMbD6b9N6wkQrX8bZtG7p9SWKG4T/5MZGZ8MLvmx50V6m4pqeM0syZzLEqx3xpQTbBhlZz0SlGRjNeL2TjYV6yovG7sgQU2dYIZ4AzCn5LJgwNOCCdzoBAG4TU4VVxMVc/wej4RIdFlx4mNIo3Q5Yu2SyuqMy/uwszptXTXzpYPus3Cb7OUaaUL2hF/Isasa72BTo8Guv6WAZQm7yTtRNF0kjDkz/G+HBRXIf5C6ze4diNdD2HRTdjWheo12DWQWABsPV2HD4Q4aHnetbyTLqrW6sEN0c8Lz0GZ8pjc0D6fsFe5TUv4Gy2k7/HEaw== gaurav-h@ubuntu"
}


resource "aws_instance" "example" {
  ami           = "ami-07a00cf47dbbc844c"
  instance_type = "t3.micro"
  subnet_id = "subnet-0f997207af9a98f20"
  key_name = "exleran-ssh"
  security_groups = ["sg-002c43a0f53539f91"]

  provisioner "file" {
    source = "/home/gaurav-h/exlearn/exlearn-bash-scripting/aws_with_tf/Day-04/terraform-file-provisners/hello.txt"
    destination = "/home/ubuntu/hello.txt"
    

  }
    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("/home/gaurav-h/exlearn/exlearn-bash-scripting/aws_with_tf/provisnors/keys/exleran")
      timeout     = "4m"
   }

  tags = {
    Name = "file-provsinors-ec2"
  }
}