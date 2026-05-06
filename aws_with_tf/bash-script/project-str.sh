#!/bin/bash

root_dir="terraform-vpc"
sub_dir="modules"
service="vpc"
vars_dir="vars"

env1="dev"
env2="qa"
env3="uat"
env4="prod"

echo "Creating Terraform project structure..."

# Create directories
mkdir -p "$root_dir/$sub_dir/$service"
mkdir -p "$root_dir/$vars_dir"

# Create root terraform files
touch "$root_dir"/{provider,main,variables,outputs,backend}.tf

# Create tfvars files
touch "$root_dir/$vars_dir"/{"$env1","$env2","$env3","$env4"}.tfvars

# Create module files
touch "$root_dir/$sub_dir/$service"/{main,variables,outputs}.tf

echo
echo "Project structure created successfully:"
tree "$root_dir"