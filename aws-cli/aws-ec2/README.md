
---

# 🚀 AWS EC2 (Elastic Compute Cloud) — Beginner to Intermediate Guide

---

## 📌 What is EC2?

Amazon EC2 (Elastic Compute Cloud) is a service that allows you to:

- Launch virtual servers (instances)
- Run applications on the cloud
- Scale infrastructure on demand

👉 EC2 = **Infrastructure as a Service (IaaS)**

📄 Reference notes: :contentReference[oaicite:0]{index=0}

---

## 🧠 Real-World Scenario

Imagine:

You want to host a web application.

Instead of:
- Buying physical servers ❌
- Managing hardware ❌

You:
- Launch an EC2 instance
- Install software
- Deploy your app

👉 You pay only for what you use

---

## 🧱 What EC2 Provides

- Virtual Machines (EC2 instances)
- Storage (EBS, Instance Store)
- Load Balancing (ELB)
- Auto Scaling (ASG)

👉 This is the **foundation of cloud infrastructure**

---

## ⚙️ EC2 Configuration Options

When launching an instance, you choose:

- Operating System (Linux / Windows / Mac)
- CPU (compute power)
- RAM (memory)
- Storage:
  - EBS (persistent)
  - Instance Store (temporary)
- Network:
  - Public IP
  - Network speed
- Security:
  - Security Groups (firewall)
- Bootstrapping:
  - User Data Script

---

## 🚀 EC2 User Data (Automation)

👉 User Data = script that runs when instance starts

Used for:
- Installing packages
- Setting up servers
- Running commands automatically

⚠️ Important:
- Runs **only once at first launch**
- Runs as **root user**

---

## 🔐 Security Groups (Very Important)

Security Groups act as a **firewall for EC2**

They control:
- Inbound traffic (incoming)
- Outbound traffic (outgoing)

---

### 🔍 Key Rules

- All inbound traffic → ❌ blocked by default  
- All outbound traffic → ✅ allowed by default  

---

### 🎯 What They Control

- Ports (22, 80, 443, etc.)
- IP ranges
- Protocols

---

### 🔥 Common Ports You Must Know

| Port | Use |
|------|-----|
| 22 | SSH (Linux login) |
| 80 | HTTP |
| 443 | HTTPS |
| 3389 | RDP (Windows) |

---

### ⚠️ Debug Tip

- Timeout → Security Group issue  
- Connection refused → Application issue  

---

## 🔑 How to Connect to EC2

### Linux / Mac
- Use SSH

```bash
ssh -i key.pem ubuntu@<public-ip>
````

---

### Windows

* Use PuTTY

---

### EC2 Instance Connect

* Browser-based connection
* No key file required
* Works mainly with Amazon Linux

---

## 🧪 Hands-On Flow

1. Launch EC2 instance
2. Configure Security Group
3. Add User Data script
4. Start instance
5. Connect via SSH
6. Stop / Start / Terminate

---

## 💻 EC2 Instance Types

Example:

```
t2.micro
```

Breakdown:

* t → instance family
* 2 → generation
* micro → size

---

### 📊 Types of Instances

#### 1. General Purpose

* Balanced (CPU + RAM)
* Example: t2.micro

---

#### 2. Compute Optimized

* High CPU usage
* Use cases:

  * Batch processing
  * High-performance apps

---

#### 3. Memory Optimized

* Large RAM workloads
* Use cases:

  * Databases
  * Caching

---

#### 4. Storage Optimized

* High disk performance
* Use cases:

  * Data warehousing
  * Big data

---

## 💰 EC2 Pricing Models

---

### 1. On-Demand

* Pay per use
* No commitment

👉 Best for:

* Short-term workloads

---

### 2. Reserved Instances

* 1 or 3 years commitment
* Up to 72% cheaper

👉 Best for:

* Long-running apps

---

### 3. Savings Plans

* Flexible usage commitment

---

### 4. Spot Instances

* Up to 90% cheaper
* Can be terminated anytime

👉 Best for:

* Batch jobs
* Non-critical workloads

---

### 5. Dedicated Hosts

* Full physical server

👉 Expensive but needed for:

* Licensing
* Compliance

---

## 🧠 Easy Analogy (Pricing)

| Type      | Analogy                    |
| --------- | -------------------------- |
| On-Demand | Hotel stay anytime         |
| Reserved  | Long-term booking discount |
| Spot      | Auction room               |
| Dedicated | Entire building            |

---

## 🔐 Shared Responsibility Model

### AWS Responsibility:

* Hardware
* Networking
* Data center security

---

### Your Responsibility:

* OS updates
* Installed software
* Security Groups
* IAM access
* Data security

---

## ⚠️ Common Beginner Mistakes

* Opening all ports (0.0.0.0/0) ❌
* Forgetting Security Groups ❌
* Not using User Data ❌
* Using wrong instance type ❌

---

## 🎯 DevOps Perspective

EC2 is not just a server.

👉 It is:

* Part of infrastructure
* Controlled via automation (Terraform)
* Integrated with:

  * IAM
  * CI/CD
  * Load balancers

---

## 🚀 What You Should Learn Next

After EC2 basics:

1. IAM (access control)
2. VPC (networking)
3. Load Balancer
4. Auto Scaling
5. Terraform (automation)

---

## ⚠️ Final Reality

If you:

* Only launch EC2 → Beginner
* SSH and install manually → Intermediate
* Automate everything → DevOps

👉 Aim for automation

---

```

---
