# 💾 EC2 Instance Storage — Beginner to Intermediate Guide

---

## 📌 Why Storage Matters in EC2

When you launch an EC2 instance:

👉 Where does your data go?

- OS files
- Application data
- Logs
- Databases

👉 If storage is not designed properly:
- Data loss ❌
- Downtime ❌
- Cost issues ❌

---

# 🧱 Types of Storage in EC2

| Storage Type | Use Case |
|-------------|--------|
| EBS | Persistent storage (most common) |
| Instance Store | Temporary high-speed storage |
| EFS | Shared storage across multiple instances |

---

# 💿 What is EBS (Elastic Block Store)?

👉 EBS = **Network-attached storage for EC2**

- Works like a **hard disk**
- Attached to EC2 instance
- Data persists even after instance stops

📄 Reference: :contentReference[oaicite:0]{index=0}

---

## 🧠 Simple Analogy

👉 Think of EBS as a:

💡 **USB drive attached over network**

- You can attach/detach
- Data stays safe

---

## ⚙️ Key Characteristics of EBS

- Network-based (not physical disk)
- Can be attached/detached
- Bound to **one Availability Zone**
- One volume → one instance (basic level)
- You pay for allocated storage

---

## ⚠️ Important Constraints

- Cannot attach volume across AZ directly  
- To move → create snapshot → restore in another AZ  

---

## 🔁 EBS Lifecycle

1. Create volume  
2. Attach to EC2  
3. Use storage  
4. Detach / delete  

---

# 🔥 Delete on Termination (Very Important)

Controls what happens when EC2 is terminated.

| Volume Type | Default Behavior |
|------------|----------------|
| Root Volume | Deleted |
| Additional Volumes | NOT deleted |

---

## 🧠 Real Use Case

- Keep root volume → debugging  
- Keep data volume → backup  

---

# 📸 EBS Snapshots (Backup)

👉 Snapshot = **backup of volume**

- Point-in-time copy
- Stored in S3 (internally)
- Used for recovery

---

## ⚙️ Snapshot Features

### 1. Archive Tier
- 75% cheaper
- Restore takes 24–72 hours

---

### 2. Recycle Bin
- Recover deleted snapshots
- Retention: 1 day → 1 year

---

## 🧠 DevOps Use Case

- Backup before deployment  
- Disaster recovery  
- Migration across regions  

---

# 📦 AMI (Amazon Machine Image)

👉 AMI = **Pre-configured EC2 template**

Includes:
- OS
- Software
- Configuration

---

## 🧠 Why AMI?

Instead of:
- Installing everything manually ❌

You:
- Create once
- Reuse many times ✅

---

## 🔁 AMI Creation Flow

1. Launch EC2  
2. Install software  
3. Stop instance  
4. Create AMI  
5. Launch new instances  

---

## 📌 Types of AMI

| Type | Description |
|------|------------|
| Public | AWS provided |
| Custom | Your own |
| Marketplace | Paid images |

---

# 📂 EFS (Elastic File System)

👉 EFS = **Shared storage across multiple EC2 instances**

- Works like network file system (NFS)
- Accessible from multiple instances
- Multi-AZ support

---

## ⚙️ Features

- Highly available  
- Scalable  
- No capacity planning  

---

## ⚠️ Trade-Off

- More expensive than EBS (~3x)

---

## 🧠 Real Use Case

- Shared application data  
- Web servers sharing files  
- Kubernetes persistent storage  

---

# 💰 EFS Infrequent Access (EFS-IA)

👉 Cost optimization for unused data

- Up to 92% cheaper  
- Automatically moves old files  

---

## 🧠 Example

👉 Files not accessed for 60 days → moved to cheaper storage

---

# 🔐 Shared Responsibility Model (Storage)

---

## AWS Responsibility

- Infrastructure  
- Hardware  
- Data replication (EBS/EFS)  

---

## Your Responsibility

- Backups (snapshots)  
- Encryption  
- Data security  
- Storage design  

---

# ⚠️ Common Beginner Mistakes

- Thinking EBS is physical disk ❌  
- Forgetting AZ limitation ❌  
- Not taking snapshots ❌  
- Deleting instance without backup ❌  
- Using EFS unnecessarily (costly) ❌  

---

# 🎯 DevOps Perspective

👉 Storage is not just “attach disk”

It is about:
- Data durability  
- Backup strategy  
- Cost optimization  
- Automation  

---

# 🚀 When to Use What

| Scenario | Use |
|--------|-----|
| Single instance storage | EBS |
| Shared storage | EFS |
| Temporary high speed | Instance Store |
| Backup | Snapshot |
| Preconfigured server | AMI |

---
