resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "tf-vpc"
  }
}


# we are now to going create the igw 

# resource "aws_internet_gateway" "gw" {
#   vpc_id = aws_vpc.main.id
#  # vpc_id = "vpc-0094175809ad3a9ae"
  

#   tags = {
#     Name = "tf-igw"
#   }
# }

resource "aws_internet_gateway" "without-vpc-gw" {
  #vpc_id = aws_vpc.main.id
 # vpc_id = "vpc-0094175809ad3a9ae"
  

  tags = {
    Name = "withoout-vpc-igw"
  }
}

resource "aws_internet_gateway_attachment" "attch-vpc" {
    vpc_id = aws_vpc.main.id
    internet_gateway_id = aws_internet_gateway.without-vpc-gw.id

  
}



# we are creating the route tables 


resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.without-vpc-gw.id
}

  tags = {
    Name = "public-rt-tf"
  }
}


resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }


  tags = {
    Name = "private-rt-tf"
  }
}




resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}


resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.11.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "private-subnet"
  }
}


resource "aws_route_table_association" "attch-pub-sub" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public-rt.id
}



# # creating sg 

# resource "aws_security_group" "custom-sg-tf" {
#     name = "custom-vpc-sg-tf"
#     vpc_id = aws_vpc.main.id
#     description = "this for the aws custom vpc"

#   ingress {
#     description = "this for the ssh acces"
#     from_port = "22"
#     to_port = "22"
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]

#   }

#  ingress {
#     description = "this for the Http acces"
#     from_port = "80"
#     to_port = "80"
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]

#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

  
# }

# # creating an ec2 insatce 



# resource "aws_instance" "example" {
#   ami           =   "ami-07a00cf47dbbc844c"
#   instance_type = "t3.micro"
#   key_name = "peering-demo"
#   subnet_id = aws_subnet.public-subnet.id
#   security_groups =[aws_security_group.custom-sg-tf.id]

#   user_data = <<-EOT
#     #!/bin/bash
#     apt update -y
#     apt install -y nginx
#     systemctl start nginx
#     systemctl enable nginx
#     # We even use the Terraform variable inside the server!
#     echo "<h1>Hello from Terraform Locals Demo  environment)</h1>" > /var/www/html/index.html
# EOT

#   tags = {
#     Name = "tf-ec2-custom-vpc"
#   }
# }

