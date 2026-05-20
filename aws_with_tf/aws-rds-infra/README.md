# Architecture Diagram

```text id="m4x8qp"
                         AWS CLOUD
┌────────────────────────────────────────────────────────────┐
│                                                            │
│                    INTERNET                                │
│                        │                                   │
│                        ▼                                   │
│              ┌─────────────────┐                           │
│              │ Internet Gateway│                           │
│              └─────────────────┘                           │
│                        │                                   │
│                        ▼                                   │
│              ┌─────────────────┐                           │
│              │ Public Route RT │                           │
│              └─────────────────┘                           │
│                        │                                   │
│        ┌────────────────────────────────┐                  │
│        │         PUBLIC SUBNET          │                  │
│        │        10.0.1.0/24             │                  │
│        │                                │                  │
│        │   ┌──────────────────────┐     │                  │
│        │   │ EC2 Bastion Server   │     │                  │
│        │   │ Amazon Linux         │     │                  │
│        │   │ MySQL Client         │     │                  │
│        │   └──────────────────────┘     │                  │
│        │                                │                  │
│        └────────────────────────────────┘                  │
│                        │                                   │
│                        │ Private Communication             │
│                        ▼                                   │
│              ┌─────────────────┐                           │
│              │ Private Route RT│                           │
│              └─────────────────┘                           │
│                        │                                   │
│                        ▼                                   │
│        ┌────────────────────────────────┐                  │
│        │        PRIVATE SUBNET          │                  │
│        │        10.0.11.0/24            │                  │
│        │                                │                  │
│        │   ┌──────────────────────┐     │                  │
│        │   │     AWS RDS MySQL    │     │                  │
│        │   │     Private Access   │     │                  │
│        │   │     Port 3306        │     │                  │
│        │   └──────────────────────┘     │                  │
│        │                                │                  │
│        └────────────────────────────────┘                  │
│                                                            │
│                                                            │
│  Security Layers:                                          │
│  ───────────────                                           │
│  • Security Groups                                         │
│  • Network ACLs                                            │
│  • Private Subnet Isolation                                │
│  • NAT Gateway for Outbound Access                         │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

---

# README.md

 id="q7n2kr"
# AWS RDS Infrastructure using Terraform

## Project Overview

This project demonstrates a production-style AWS infrastructure setup using Terraform.

The architecture includes:

- Custom VPC
- Public and Private Subnets
- NAT Gateway
- Internet Gateway
- Route Tables
- Network ACLs (NACL)
- Security Groups
- EC2 Bastion Server
- AWS RDS MySQL Database
- Remote State Management using S3 Backend

---

# Architecture

## High-Level Flow

Internet
↓
Public Subnet
↓
EC2 Bastion Server
↓
Private Subnet
↓
RDS MySQL Database

---

# Key Learning Objectives

Students will learn:

- Terraform Modules
- Remote Backend Configuration
- Terraform Remote State
- AWS VPC Architecture
- Public vs Private Subnets
- NAT Gateway Usage
- Internet Gateway
- Route Tables
- Security Groups
- Network ACLs
- Bastion Architecture
- RDS Deployment
- Private Database Access
- Production Tagging Standards

---

# Folder Structure

```bash
.
├── environments
│   ├── rds-env
│   │   └── dev
│   └── vpc-env
│       └── dev
│
└── modules
    ├── rds
    └── vpc
```

---

# Infrastructure Components

## VPC

Custom VPC created using Terraform.

CIDR:
```bash
10.0.0.0/16
```

---

# Public Subnets

Used for:
- Bastion Server
- Public Access

Example:
```bash
10.0.1.0/24
```

---

# Private Subnets

Used for:
- RDS Database

Example:
```bash
10.0.11.0/24
```

---

# Internet Gateway

Provides internet access to public subnet resources.

---

# NAT Gateway

Allows private subnet resources to access the internet securely without exposing them publicly.

Example:
- Software Updates
- Package Downloads

---

# Route Tables

Public Route Table:
```bash
0.0.0.0/0 → Internet Gateway
```

Private Route Table:
```bash
0.0.0.0/0 → NAT Gateway
```

---

# Security Groups

## EC2 Security Group

Allows:
- SSH (22)
- HTTP (80)

---

## RDS Security Group

Allows:
- MySQL (3306)
- Access only from EC2 Security Group

---

# Network ACLs

## Public NACL

Allows:
- HTTP
- HTTPS
- SSH
- Ephemeral Ports

---

## Private NACL

Allows:
- MySQL Traffic
- Internal Communication

---

# Important Networking Concept

## Security Group

Stateful Firewall

Return traffic automatically allowed.

---

## Network ACL

Stateless Firewall

Inbound and outbound rules must be explicitly allowed.

---

# RDS Configuration

Database Engine:
```bash
MySQL 8.0
```

Instance Type:
```bash
db.t3.micro
```

Storage:
```bash
20 GB
```

Deployment Type:
```bash
Single AZ
```

Visibility:
```bash
Private
```

---

# Why RDS is Private?

Production databases should never be exposed directly to the internet.

Access Flow:

Laptop
↓
EC2 Bastion
↓
RDS

This improves:
- Security
- Isolation
- Compliance

---

# Terraform Deployment Steps

## Step 1 — Deploy VPC

```bash
cd environments/vpc-env/dev

terraform init

terraform plan

terraform apply
```

---

## Step 2 — Deploy RDS

```bash
cd environments/rds-env/dev

terraform init

terraform plan

terraform apply
```

---

# Connect EC2 to RDS

SSH into EC2:

```bash
ssh -i your-key.pem ec2-user@EC2_PUBLIC_IP
```

Install MySQL Client:

```bash
sudo yum install mariadb105 -y
```

Connect to RDS:

```bash
mysql -h RDS_ENDPOINT -u admin -p
```

---

# MySQL Commands

Show Databases:

```sql
SHOW DATABASES;
```

Use Database:

```sql
USE devdb;
```

Create Table:

```sql
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);
```

Insert Data:

```sql
INSERT INTO students(name)
VALUES("Gaurav");
```

Verify Data:

```sql
SELECT * FROM students;
```

---

# Production Concepts Covered

- Layered Terraform Architecture
- Modular Terraform Design
- Infrastructure Separation
- Remote State Management
- Bastion Architecture
- Least Privilege Networking
- Private Database Deployment
- Stateful vs Stateless Firewalls

---

# Important Interview Questions

## Why keep RDS in private subnet?

To prevent direct internet access and improve security.

---

## Difference between Security Group and NACL?

Security Group:
- Stateful

NACL:
- Stateless

---

## Why use NAT Gateway?

Private subnet resources need outbound internet access securely.

---

## Why use Terraform Modules?

To improve:
- Reusability
- Scalability
- Maintainability

---

# Real-World Use Case

This architecture represents a simplified production-style backend infrastructure where:

- Application Servers run in public/private subnets
- Databases remain isolated
- Network access is controlled
- Infrastructure is managed as code

---

# Author

Gaurav Halnawar

Cloud & DevOps Engineering
````
