#!/bin/bash

root_dir="terraform-aws-infra"

echo "Creating Terraform production structure..."

# Create root directories
mkdir -p "$root_dir"/{environments,modules}

# Create environment directories
mkdir -p "$root_dir/environments"/{dev,qa,uat,prod}

# Create module directories
mkdir -p "$root_dir/modules"/vpc



# Create environment files
for env in dev qa uat prod
do
    touch "$root_dir/environments/$env"/{backend,main,variables,outputs}.tf
    touch "$root_dir/environments/$env/terraform.tfvars"
done

# Create module files
for module in vpc # if you want you can add more module here like (alb sg iam)
do
    touch "$root_dir/modules/$module"/{main,variables,outputs,providers}.tf
done

echo
echo "Project structure created successfully:"
ls -l  "$root_dir"