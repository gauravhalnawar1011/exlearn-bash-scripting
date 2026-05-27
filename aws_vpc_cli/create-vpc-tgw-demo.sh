#!/bin/bash

set -euo pipefail

##############################################
# VARIABLES
##############################################

REGION="ap-south-1"
PROJECT="TGW-DEMO"

# RFC1918 Private ranges

VPC1_NAME="VPC1"
VPC1_CIDR="10.10.0.0/16"

VPC2_NAME="VPC2"
VPC2_CIDR="172.16.0.0/16"

VPC3_NAME="VPC3"
VPC3_CIDR="192.168.0.0/16"

AZ1="ap-south-1a"
AZ2="ap-south-1b"

##############################################
# LOG FUNCTION
##############################################

log() {
echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1"
}

##############################################
# CREATE VPC
##############################################

create_vpc() {

NAME=$1
CIDR=$2
PUBLIC_CIDR=$3
PRIVATE_CIDR=$4

log "Creating $NAME"

##############################################
# CREATE VPC
##############################################

VPC_ID=$(aws ec2 create-vpc \
--cidr-block "$CIDR" \
--region "$REGION" \
--tag-specifications \
"ResourceType=vpc,Tags=[{Key=Name,Value=$NAME},{Key=Environment,Value=Demo},{Key=Project,Value=$PROJECT}]" \
--query 'Vpc.VpcId' \
--output text)

log "$NAME created : $VPC_ID"

##############################################
# ENABLE DNS
##############################################

aws ec2 modify-vpc-attribute \
--vpc-id "$VPC_ID" \
--enable-dns-support "{\"Value\":true}"

aws ec2 modify-vpc-attribute \
--vpc-id "$VPC_ID" \
--enable-dns-hostnames "{\"Value\":true}"

##############################################
# CREATE IGW
##############################################

IGW_ID=$(aws ec2 create-internet-gateway \
--tag-specifications \
"ResourceType=internet-gateway,Tags=[{Key=Name,Value=${NAME}-IGW}]" \
--query 'InternetGateway.InternetGatewayId' \
--output text)

aws ec2 attach-internet-gateway \
--internet-gateway-id "$IGW_ID" \
--vpc-id "$VPC_ID"

log "IGW attached"

##############################################
# CREATE SUBNETS
##############################################

PUB_SUBNET=$(aws ec2 create-subnet \
--vpc-id "$VPC_ID" \
--cidr-block "$PUBLIC_CIDR" \
--availability-zone "$AZ1" \
--tag-specifications \
"ResourceType=subnet,Tags=[{Key=Name,Value=${NAME}-Public}]" \
--query 'Subnet.SubnetId' \
--output text)

PRIV_SUBNET=$(aws ec2 create-subnet \
--vpc-id "$VPC_ID" \
--cidr-block "$PRIVATE_CIDR" \
--availability-zone "$AZ2" \
--tag-specifications \
"ResourceType=subnet,Tags=[{Key=Name,Value=${NAME}-Private}]" \
--query 'Subnet.SubnetId' \
--output text)

log "Subnets created"

##############################################
# ROUTE TABLE
##############################################

RT_ID=$(aws ec2 create-route-table \
--vpc-id "$VPC_ID" \
--tag-specifications \
"ResourceType=route-table,Tags=[{Key=Name,Value=${NAME}-Public-RT}]" \
--query 'RouteTable.RouteTableId' \
--output text)

aws ec2 create-route \
--route-table-id "$RT_ID" \
--destination-cidr-block "0.0.0.0/0" \
--gateway-id "$IGW_ID"

aws ec2 associate-route-table \
--subnet-id "$PUB_SUBNET" \
--route-table-id "$RT_ID"

##############################################
# OUTPUT
##############################################

echo "================================="
echo "VPC Name      : $NAME" 
echo "VPC ID        : $VPC_ID"
echo "VPC CIDR      : $CIDR"
echo "PublicSubnet  : $PUB_SUBNET"
echo "PrivateSubnet : $PRIV_SUBNET"
echo "================================="

##############################################
# for the creating ec2 instances use below commands 
##############################################

# echo "./vpc1_create_ec2.sh subnet-016ebc35cb5e3232f " 
# echo "./vpc2_create_ec2.sh  subnet-085f28077129ef76c" 
# echo "./vpc3_create_ec2.sh  subnet-09c66b52270f84fe3"

}

##############################################
# CREATE VPCS
##############################################

create_vpc \
"$VPC1_NAME" \
"$VPC1_CIDR" \
"10.10.1.0/24" \
"10.10.2.0/24"

create_vpc \
"$VPC2_NAME" \
"$VPC2_CIDR" \
"172.16.1.0/24" \
"172.16.2.0/24"

create_vpc \
"$VPC3_NAME" \
"$VPC3_CIDR" \
"192.168.1.0/24" \
"192.168.2.0/24"

log "All VPCs created successfully"