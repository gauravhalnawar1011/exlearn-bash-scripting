#!/bin/bash

mkdir -p aws-s3-lambda-sns

cd aws-s3-lambda-sns || exit

#################################################
# ENVIRONMENTS
#################################################

mkdir -p environments/{dev,qa,uat,prod}

#################################################
# MODULES
#################################################

mkdir -p modules/s3
mkdir -p modules/sns
mkdir -p modules/iam
mkdir -p modules/lambda
mkdir -p modules/event-permissions

#################################################
# SCRIPTS
#################################################

mkdir -p scripts

#################################################
# ENVIRONMENT FILES
#################################################

for env in dev qa uat prod
do

touch environments/$env/backend.tf
touch environments/$env/providers.tf
touch environments/$env/data.tf
touch environments/$env/main.tf
touch environments/$env/variables.tf
touch environments/$env/outputs.tf
touch environments/$env/terraform.tfvars

done

#################################################
# S3 MODULE
#################################################

touch modules/s3/bucket.tf
touch modules/s3/notification.tf
touch modules/s3/variables.tf
touch modules/s3/outputs.tf

#################################################
# SNS MODULE
#################################################

touch modules/sns/topic.tf
touch modules/sns/subscription.tf
touch modules/sns/variables.tf
touch modules/sns/outputs.tf

#################################################
# IAM MODULE
#################################################

touch modules/iam/role.tf
touch modules/iam/policy.tf
touch modules/iam/variables.tf
touch modules/iam/outputs.tf

#################################################
# LAMBDA MODULE
#################################################

touch modules/lambda/lambda.tf
touch modules/lambda/lambda_function.py
touch modules/lambda/variables.tf
touch modules/lambda/outputs.tf

#################################################
# EVENT PERMISSIONS MODULE
#################################################

touch modules/event-permissions/lambda-permission.tf
touch modules/event-permissions/variables.tf
touch modules/event-permissions/outputs.tf

#################################################
# SCRIPTS
#################################################

touch scripts/deploy.sh
touch scripts/destroy.sh

#################################################
# README
#################################################

touch README.md

tree