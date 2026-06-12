variable "environment" {
  type = string
}

variable "managed_by" {
  type = string
}

variable "project_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "igw_name" {
  type = string
}

variable "public_rt_name" {
  type = string
}


variable "ami_id" {
  
}

variable "instance_type" {
  
}


variable "key_name" {
  
}


variable "instance_name" {
  


}

