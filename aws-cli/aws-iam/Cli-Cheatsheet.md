# ⚙️ AWS CLI Setup

```bash
aws configure
````

Provide:

* Access Key
* Secret Key
* Region (e.g. ap-south-1)

---

# 👤 IAM USER COMMANDS

## Create User

```bash
aws iam create-user --user-name devops-user
```

## Delete User

```bash
aws iam delete-user --user-name devops-user
```

## List Users

```bash
aws iam list-users
```

---

## 🔑 Access Keys

### Create Access Key

```bash
aws iam create-access-key --user-name devops-user
```

### List Access Keys

```bash
aws iam list-access-keys --user-name devops-user
```

### Delete Access Key

```bash
aws iam delete-access-key \
  --user-name devops-user \
  --access-key-id <KEY_ID>
```

---

## 🔐 Login Profile (Console Access)

### Create Password

```bash
aws iam create-login-profile \
  --user-name devops-user \
  --password 'Password@123'
```

### Delete Password

```bash
aws iam delete-login-profile \
  --user-name devops-user
```

---

# 👥 IAM GROUP COMMANDS

## Create Group

```bash
aws iam create-group --group-name devops-team
```

## Delete Group

```bash
aws iam delete-group --group-name devops-team
```

## Add User to Group

```bash
aws iam add-user-to-group \
  --user-name devops-user \
  --group-name devops-team
```

## Remove User from Group

```bash
aws iam remove-user-from-group \
  --user-name devops-user \
  --group-name devops-team
```

---

# 📜 POLICY COMMANDS

## List AWS Managed Policies

```bash
aws iam list-policies --scope AWS
```

## Create Custom Policy

```bash
aws iam create-policy \
  --policy-name MyPolicy \
  --policy-document file://policy.json
```

## Delete Policy

```bash
aws iam delete-policy \
  --policy-arn <POLICY_ARN>
```

---

# 🔗 ATTACH / DETACH POLICIES

## Attach Policy to User

```bash
aws iam attach-user-policy \
  --user-name devops-user \
  --policy-arn <POLICY_ARN>
```

## Detach Policy from User

```bash
aws iam detach-user-policy \
  --user-name devops-user \
  --policy-arn <POLICY_ARN>
```

---

## Attach Policy to Role

```bash
aws iam attach-role-policy \
  --role-name my-role \
  --policy-arn <POLICY_ARN>
```

---

## Attach Policy to Group

```bash
aws iam attach-group-policy \
  --group-name devops-team \
  --policy-arn <POLICY_ARN>
```

---

# 🎭 IAM ROLE COMMANDS

## Create Role

```bash
aws iam create-role \
  --role-name my-role \
  --assume-role-policy-document file://trust-policy.json
```

---

## Delete Role (Important Order)

### 1. Detach Policies

```bash
aws iam detach-role-policy \
  --role-name my-role \
  --policy-arn <POLICY_ARN>
```

### 2. Delete Role

```bash
aws iam delete-role --role-name my-role
```

---

## List Roles

```bash
aws iam list-roles
```

---

# 📦 INSTANCE PROFILE (EC2 ROLE)

## Create Instance Profile

```bash
aws iam create-instance-profile \
  --instance-profile-name my-profile
```

## Add Role to Instance Profile

```bash
aws iam add-role-to-instance-profile \
  --instance-profile-name my-profile \
  --role-name my-role
```

---

# 🧪 INLINE POLICIES

## List Inline Policies

```bash
aws iam list-user-policies --user-name devops-user
```

## Delete Inline Policy

```bash
aws iam delete-user-policy \
  --user-name devops-user \
  --policy-name <NAME>
```

---

# 🔁 LOOP (DEVOPS LEVEL)

## Attach Multiple Policies

```bash
for policy in \
arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess \
arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess
do
  aws iam attach-user-policy \
    --user-name devops-user \
    --policy-arn $policy
done
```

---
