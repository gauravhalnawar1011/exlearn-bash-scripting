variable "aws_region" {
  type = string
  default = "ap-south-1"
}

variable "ami_id" {
  type = string 
  default = "ami-07a00cf47dbbc844c"
}

variable "instance_type" {
  type = string 
  default = "t3.micro"
}

variable "key_name" {
  sensitive = true
  type = string
  default = "peering-demo"
}

variable "subnet_id" {
    type = string
    default = "subnet-0e9c7fad546056a0a"
  
}

variable "instance_name" {
  default = "tf-day-01"
}