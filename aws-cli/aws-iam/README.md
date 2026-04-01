
---

## 📌 What is IAM?


IAM: Users & Groups
• IAM = Identity and Access Management, Global service
• Root account created by default, shouldn’t be used or shared
• Users are people within your organization, and can be grouped
• Groups only contain users, not other groups
• Users don’t have to belong to a group, and user can belong to multiple groups


**IAM (Identity and Access Management)** is a service in AWS that controls:
- Who can access AWS
- What actions they can perform
- On which resources

---

## 🧠 Real-Life Analogy

Think of a company:

- **Employees** → IAM Users  
- **Teams/Departments** → IAM Groups  
- **Permissions/Access Cards** → Policies  
- **Temporary Access (Contractors, Services)** → Roles  

👉 Example:

A developer:
- Can access EC2 (servers)
- Cannot delete S3 backups

This is enforced using IAM.

---

## 🧱 IAM Core Components

| Component | Description |
|----------|------------|
| User | Individual identity |
| Group | Collection of users |
| Policy | JSON defining permissions |
| Role | Temporary access for services |
| Policy Types | Managed / Inline |

---

# 🔐 AWS Identity and Access Management — Interview Questions (DevOps Level)

---

# 🟢 Level 1 — Foundation (Must Know or Reject Candidate)

## 1. What is IAM?

👉 Expected:

* Service for authentication + authorization
* Controls access to AWS resources

---

## 2. Difference between User, Group, Role?

👉 Weak answer = reject

**Correct direction:**

* User → permanent identity
* Group → collection of users
* Role → temporary access via assumption

---

## 3. What is a Policy?

👉 Expected:

* JSON document defining permissions

Follow-up:
👉 “What are main elements in policy?”

Expected:

* Effect
* Action
* Resource

---

## 4. What is least privilege?

👉 If they say “give minimum access” and stop → shallow

Expected:

* Only required permissions
* Time-bound + scoped access

---

# 🟡 Level 2 — Practical Understanding

## 5. Why should we NOT attach policies directly to users?

👉 Expected:

* Hard to manage
* Not scalable
* Use groups instead

---

## 6. What happens if two policies conflict?

👉 Expected:

* **Explicit DENY always wins**

---

## 7. Difference between Managed and Inline policies?

👉 Expected:

| Managed          | Inline                 |
| ---------------- | ---------------------- |
| Reusable         | Attached to one entity |
| AWS or customer  | Custom                 |
| Easier to manage | Hard to scale          |

---

## 8. What is Assume Role?

👉 Expected:

* Temporary credentials via STS
* Used by services or cross-account

---

## 9. How does EC2 access S3 without access keys?

👉 Expected:

* IAM Role attached to EC2
* Instance profile
* Temporary credentials

👉 If they say “access key in code” → reject

---

# 🔴 Level 3 — DevOps Real-World Scenarios

## 10. Your CI/CD pipeline needs AWS access. How will you design IAM?

👉 Expected:

* Use IAM Role
* Assume role via OIDC / STS
* No hardcoded credentials

---

## 11. Developer needs read-only access to S3 but full access to EC2. How?

👉 Expected:

* Attach multiple policies
* Either via group or role

---

## 12. You cannot delete an IAM role. Why?

👉 Expected:

* Attached policies
* Instance profile
* Dependencies

---

## 13. What is trust policy vs permission policy?

👉 This separates average vs strong candidate

Expected:

* **Trust Policy** → Who can assume role
* **Permission Policy** → What role can do

---

## 14. How do you debug “Access Denied”?

👉 Expected approach:

* Check IAM policy
* Check resource policy
* Check explicit deny
* Check role assumption

---

## 15. How would you give temporary access to a user for 1 hour?

👉 Expected:

* Assume role with session duration
* STS tokens

---

# 🔥 Level 4 — Advanced (Real DevOps Thinking)

## 16. How IAM integrates with Terraform?

👉 Expected:

* Terraform uses IAM credentials
* Can assume roles
* State access via IAM

---

## 17. How IAM works in Kubernetes (EKS)?

👉 Expected:

* IRSA (IAM Roles for Service Accounts)
* Pods assume IAM roles

---

## 18. What is policy evaluation logic?

👉 Expected flow:

1. Explicit Deny
2. Allow
3. Default Deny

---

## 19. How to design IAM for multi-team organization?

👉 Expected:

* Separate groups
* Role-based access
* Least privilege
* Naming conventions

---

## 20. What are common IAM mistakes?

👉 Expected:

* Using AdminAccess everywhere
* Hardcoding credentials
* No role usage
* Over-permission

---

# 🎯 How YOU Should Use This

Don’t just ask questions.

### Do this:

* Ask → Wait → Let them struggle
* Ask follow-up → go deeper
* Challenge wrong answers

# ⚠️ IMPORTANT RULES

* ❌ Don’t attach policies directly to users (use groups)
* ❌ Don’t use Admin access in production
* ✅ Use roles for services (EC2, Lambda, CI/CD)
* ✅ Follow least privilege principle

---

# 🚨 COMMON ERRORS

| Problem            | Reason                           |
| ------------------ | -------------------------------- |
| Cannot delete user | Access keys or policies attached |
| Cannot delete role | Instance profile attached        |
| Access denied      | Wrong policy                     |
| CLI not working    | Credentials not configured       |

---

# 🎯 DEVOPS USE CASES

* Terraform uses IAM credentials
* CI/CD pipelines assume roles
* Kubernetes uses IAM roles (IRSA)
* EC2 uses roles to access S3

---

# 🧠 FINAL TAKEAWAY

IAM is not about commands.

👉 It’s about **access control design**

If you don’t understand:

* who gets access
* what they can do
* why they need it

You will misconfigure everything.

---

