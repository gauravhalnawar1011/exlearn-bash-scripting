variable "environment" {

  type = string
}

variable "vpc_id" {

  type = string
}

variable "vpc_cidr" {

  type = string
}

variable "private_subnet_ids" {

  type = list(string)
}

#################################################
# DATABASE VARIABLES
#################################################

variable "db_name" {

  type = string
}

variable "db_username" {

  type = string
}

variable "db_password" {

  type      = string

  sensitive = true
}

variable "aws_region" {
  default = "ap-south-1"
}