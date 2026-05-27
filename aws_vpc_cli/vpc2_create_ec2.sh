#!/bin/bash

set -euo pipefail

##############################################
# VARIABLES
##############################################

REGION="ap-south-1"

INSTANCE_NAME="Peering-Demo-EC2-vpc-2"

AMI_ID="ami-07a00cf47dbbc844c"

INSTANCE_TYPE="m7i-flex.large"


KEY_NAME="peering-demo"

SUBNET_ID=$1

##############################################
# LOG FUNCTION
##############################################

log(){
echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1"
}

##############################################
# GET VPC ID FROM SUBNET
##############################################

VPC_ID=$(aws ec2 describe-subnets \
--subnet-ids "$SUBNET_ID" \
--query 'Subnets[0].VpcId' \
--output text)

log "VPC ID: $VPC_ID"

##############################################
# CREATE SECURITY GROUP
##############################################

SG_ID=$(aws ec2 create-security-group \
--group-name "peering-demo-sg-$(date +%s)" \
--description "Security group for peering demo" \
--vpc-id "$VPC_ID" \
--query 'GroupId' \
--output text)

log "Security Group Created: $SG_ID"

##############################################
# HTTP
##############################################

aws ec2 authorize-security-group-ingress \
--group-id "$SG_ID" \
--protocol tcp \
--port 80 \
--cidr 0.0.0.0/0

##############################################
# SSH
##############################################

aws ec2 authorize-security-group-ingress \
--group-id "$SG_ID" \
--protocol tcp \
--port 22 \
--cidr 0.0.0.0/0

##############################################
# ICMP
##############################################

aws ec2 authorize-security-group-ingress \
--group-id "$SG_ID" \
--protocol icmp \
--port -1 \
--cidr 0.0.0.0/0

log "Security group rules configured"

##############################################
# ENABLE PUBLIC IP
##############################################

aws ec2 modify-subnet-attribute \
--subnet-id "$SUBNET_ID" \
--map-public-ip-on-launch

##############################################
# LAUNCH EC2
##############################################

INSTANCE_ID=$(aws ec2 run-instances \
--image-id "$AMI_ID" \
--instance-type "$INSTANCE_TYPE" \
--key-name "$KEY_NAME" \
--subnet-id "$SUBNET_ID" \
--security-group-ids "$SG_ID" \
--tag-specifications \
"ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME}]" \
--query 'Instances[0].InstanceId' \
--output text)

log "Instance launched: $INSTANCE_ID"

##############################################
# WAIT
##############################################

aws ec2 wait instance-running \
--instance-ids "$INSTANCE_ID"

PUBLIC_IP=$(aws ec2 describe-instances \
--instance-ids "$INSTANCE_ID" \
--query 'Reservations[0].Instances[0].PublicIpAddress' \
--output text)

echo "=================================="
echo "Instance ID : $INSTANCE_ID"
echo "Public IP   : $PUBLIC_IP"
echo "Key Pair    : $KEY_NAME"
echo "SG ID       : $SG_ID"
echo "=================================="