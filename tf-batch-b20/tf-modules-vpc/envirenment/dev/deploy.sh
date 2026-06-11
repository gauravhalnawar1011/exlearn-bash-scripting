#!/bin/bash

set -e

#################################################
# APPLY
#################################################

apply() {

  echo "=================================="
  echo "Terraform Init"
  echo "=================================="

  terraform init

  echo "=================================="
  echo "Terraform Validate"
  echo "=================================="

  terraform validate

  echo "=================================="
  echo "Terraform Plan"
  echo "=================================="

  terraform plan \
    -var-file=terraform.tfvars

  echo "=================================="
  echo "Terraform Apply"
  echo "=================================="

  terraform apply \
    -var-file=terraform.tfvars \
    --auto-approve
}

#################################################
# DESTROY
#################################################

destroy() {

  echo "=================================="
  echo "Terraform Destroy"
  echo "=================================="

  terraform destroy \
    -var-file=terraform.tfvars \
    --auto-approve
}

#################################################
# MAIN
#################################################

case "$1" in

  apply)
    apply
    ;;

  destroy)
    destroy
    ;;

  *)
    echo ""
    echo "Usage:"
    echo "./deploy.sh apply"
    echo "./deploy.sh destroy"
    echo ""
    exit 1
    ;;

esac