#!/bin/bash 

terraform workspace show 
terraform workspace select dev 
terraform init
terraform plan -var-file="/home/gaurav-h/exlearn/exlearn-bash-scripting/aws_with_tf/Day-05-s3/vars/dev.tfvars"
terraform apply -var-file="/home/gaurav-h/exlearn/exlearn-bash-scripting/aws_with_tf/Day-05-s3/vars/dev.tfvars" --auto-approve

