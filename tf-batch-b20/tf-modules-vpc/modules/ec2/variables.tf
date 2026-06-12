variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "instance_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "managed_by" {
  type = string
}

variable "project_name" {
  type = string
}

variable "aws_region" {
  type = string
}