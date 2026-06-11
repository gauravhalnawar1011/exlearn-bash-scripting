variable "aws_region" {
  type = string

}

variable "ami_id" {
  type = string 

}

variable "instance_type" {
  type = string 

}

variable "key_name" {
  sensitive = true
  type = string
}

variable "subnet_id" {
    type = string

  
}

variable "instance_name" {

}



variable "environment" {
  
}

variable "managed_by" {
  
}

variable "project_name" {
  
}

variable "security_groups" {
  
}