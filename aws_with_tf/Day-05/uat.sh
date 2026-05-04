#!/bin/bash 

terraform workspace show 
terraform workspace select uat
terraform init
terraform plan -var-file="uat.tfvars"
terraform apply -var-file="uat.tfvars" --auto-approve