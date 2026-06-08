terraform {

  required_version = ">= 1.8.0"

  required_providers {

    aws = {

      source = "hashicorp/aws"

      version = "~> 6.0"
    }

    archive = {

      source = "hashicorp/archive"

      version = "~> 2.5"
    }

    random = {

      source = "hashicorp/random"

      version = "~> 3.7"
    }
  }
}

provider "aws" {

  region = "ap-south-1"
}