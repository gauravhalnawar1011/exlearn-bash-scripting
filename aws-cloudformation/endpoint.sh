#!/bin/bash


REGION="ap-south-1"

echo "=============================="
echo "STEP 1: Create VPC"
echo "=============================="

VPC_ID=$(aws ec2 create-vpc \
  --cidr-block 10.0.0.0/16 \
  --region $REGION \
  --query 'Vpc.VpcId' \
  --output text)

aws ec2 create-tags --resources $VPC_ID \
  --tags Key=Name,Value=prod-vpc \
  --region $REGION

echo "VPC_ID: $VPC_ID"


echo "=============================="
echo "STEP 2: Create Subnets with Tags"
echo "=============================="

# ---------- PUBLIC SUBNETS ----------
PUB1=$(aws ec2 create-subnet \
  --vpc-id $VPC_ID \
  --cidr-block 10.0.1.0/24 \
  --availability-zone ap-south-1a \
  --region $REGION \
  --query 'Subnet.SubnetId' --output text)

aws ec2 create-tags --resources $PUB1 \
  --tags Key=Name,Value=public-1-ap-south-1a Key=Type,Value=Public \
  --region $REGION


PUB2=$(aws ec2 create-subnet \
  --vpc-id $VPC_ID \
  --cidr-block 10.0.2.0/24 \
  --availability-zone ap-south-1b \
  --region $REGION \
  --query 'Subnet.SubnetId' --output text)

aws ec2 create-tags --resources $PUB2 \
  --tags Key=Name,Value=public-2-ap-south-1b Key=Type,Value=Public \
  --region $REGION


PUB3=$(aws ec2 create-subnet \
  --vpc-id $VPC_ID \
  --cidr-block 10.0.3.0/24 \
  --availability-zone ap-south-1c \
  --region $REGION \
  --query 'Subnet.SubnetId' --output text)

aws ec2 create-tags --resources $PUB3 \
  --tags Key=Name,Value=public-3-ap-south-1c Key=Type,Value=Public \
  --region $REGION


# ---------- PRIVATE SUBNETS ----------
PRIV1=$(aws ec2 create-subnet \
  --vpc-id $VPC_ID \
  --cidr-block 10.0.11.0/24 \
  --availability-zone ap-south-1a \
  --region $REGION \
  --query 'Subnet.SubnetId' --output text)

aws ec2 create-tags --resources $PRIV1 \
  --tags Key=Name,Value=private-1-ap-south-1a Key=Type,Value=Private \
  --region $REGION


PRIV2=$(aws ec2 create-subnet \
  --vpc-id $VPC_ID \
  --cidr-block 10.0.12.0/24 \
  --availability-zone ap-south-1b \
  --region $REGION \
  --query 'Subnet.SubnetId' --output text)

aws ec2 create-tags --resources $PRIV2 \
  --tags Key=Name,Value=private-2-ap-south-1b Key=Type,Value=Private \
  --region $REGION


PRIV3=$(aws ec2 create-subnet \
  --vpc-id $VPC_ID \
  --cidr-block 10.0.13.0/24 \
  --availability-zone ap-south-1c \
  --region $REGION \
  --query 'Subnet.SubnetId' --output text)

aws ec2 create-tags --resources $PRIV3 \
  --tags Key=Name,Value=private-3-ap-south-1c Key=Type,Value=Private \
  --region $REGION


echo "=============================="
echo "STEP 3: Enable Public IP on Public Subnets"
echo "=============================="

aws ec2 modify-subnet-attribute --subnet-id $PUB1 --map-public-ip-on-launch --region $REGION
aws ec2 modify-subnet-attribute --subnet-id $PUB2 --map-public-ip-on-launch --region $REGION
aws ec2 modify-subnet-attribute --subnet-id $PUB3 --map-public-ip-on-launch --region $REGION


echo "=============================="
echo "STEP 4: Create Internet Gateway"
echo "=============================="

IGW_ID=$(aws ec2 create-internet-gateway \
  --region $REGION \
  --query 'InternetGateway.InternetGatewayId' \
  --output text)

aws ec2 create-tags --resources $IGW_ID \
  --tags Key=Name,Value=prod-igw \
  --region $REGION

aws ec2 attach-internet-gateway \
  --vpc-id $VPC_ID \
  --internet-gateway-id $IGW_ID \
  --region $REGION


echo "=============================="
echo "STEP 5: Public Route Table"
echo "=============================="

PUB_RT=$(aws ec2 create-route-table \
  --vpc-id $VPC_ID \
  --region $REGION \
  --query 'RouteTable.RouteTableId' \
  --output text)

aws ec2 create-tags --resources $PUB_RT \
  --tags Key=Name,Value=public-rt \
  --region $REGION

aws ec2 create-route \
  --route-table-id $PUB_RT \
  --destination-cidr-block 0.0.0.0/0 \
  --gateway-id $IGW_ID \
  --region $REGION

aws ec2 associate-route-table --subnet-id $PUB1 --route-table-id $PUB_RT --region $REGION
aws ec2 associate-route-table --subnet-id $PUB2 --route-table-id $PUB_RT --region $REGION
aws ec2 associate-route-table --subnet-id $PUB3 --route-table-id $PUB_RT --region $REGION


echo "=============================="
echo "STEP 6: Private Route Table"
echo "=============================="

PRIV_RT=$(aws ec2 create-route-table \
  --vpc-id $VPC_ID \
  --region $REGION \
  --query 'RouteTable.RouteTableId' \
  --output text)

aws ec2 create-tags --resources $PRIV_RT \
  --tags Key=Name,Value=private-rt \
  --region $REGION

aws ec2 associate-route-table --subnet-id $PRIV1 --route-table-id $PRIV_RT --region $REGION
aws ec2 associate-route-table --subnet-id $PRIV2 --route-table-id $PRIV_RT --region $REGION
aws ec2 associate-route-table --subnet-id $PRIV3 --route-table-id $PRIV_RT --region $REGION


echo "=============================="
echo "VPC SETUP COMPLETE"
echo "=============================="