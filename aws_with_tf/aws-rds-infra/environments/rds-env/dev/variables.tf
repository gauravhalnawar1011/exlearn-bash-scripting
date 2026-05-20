#################################################
# AWS
#################################################

variable "aws_region" {

  type = string

  default = "ap-south-1"
}

#################################################
# ENVIRONMENT
#################################################

variable "environment" {

  type = string
}

#################################################
# NETWORK
#################################################

variable "vpc_cidr" {

  type = string
}

#################################################
# DATABASE
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
variable "key_name" {
  
}