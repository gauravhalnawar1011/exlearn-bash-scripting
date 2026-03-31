
---

# 🚀 AWS CLI Installation using Bash Script (Ubuntu / Debian & RedHat)

## 📌 Overview

This guide helps you install the AWS CLI using a Bash script on:

- Ubuntu / Debian-based systems
- RedHat-based systems (RHEL, CentOS, Amazon Linux)

For other operating systems, refer to the official AWS documentation:  
👉 https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

---

## 🧰 Prerequisites

Make sure your system has:

- Internet connection
- `curl` installed
- `sudo` access

---

## 📥 Step 1: Download the Installation Script

### 🟢 Debian / Ubuntu

```bash
curl -L -O https://raw.githubusercontent.com/gauravhalnawar1011/exlearn-bash-scripting/main/aws-cli/aws-cli-installation/aws-cli-install.sh
````

---

### 🔴 RedHat / CentOS / Amazon Linux

```bash
curl -L -O https://raw.githubusercontent.com/gauravhalnawar1011/exlearn-bash-scripting/main/aws-cli/aws-cli-installation/aws-cli-install-redhat.sh
```

---

## 🔐 Step 2: Give Execute Permission

👉 Run based on your OS:

### Debian / Ubuntu

```bash
chmod u+x aws-cli-install.sh
```

### RedHat

```bash
chmod u+x aws-cli-install-redhat.sh
```

---

## ▶️ Step 3: Run the Script

👉 Run only the script relevant to your OS:

### Debian / Ubuntu

```bash
./aws-cli-install.sh
```

### RedHat

```bash
./aws-cli-install-redhat.sh
```

---

## 🔍 Step 4: Verify Installation

```bash
aws --version
```

Expected output:

```
aws-cli/2.x.x Python/3.x Linux/x86_64
```

---

## ⚙️ What This Script Does

The script performs:

* Updates system packages
* Installs dependencies (`unzip`, `curl`)
* Downloads AWS CLI
* Extracts installation files
* Installs AWS CLI
* Verifies installation

---

## ⚠️ Notes

* Requires `sudo` privileges
* Re-running script may overwrite existing installation
* Always verify installation

---

## 🧠 Best Practice

Configure AWS CLI after installation:

```bash
aws configure
```

Provide:

* Access Key
* Secret Key
* Region (e.g. ap-south-1)
* Output format (json)

---

## 🚨 Troubleshooting

| Issue               | Solution                       |
| ------------------- | ------------------------------ |
| Command not found   | Restart terminal or check PATH |
| Permission denied   | Run `chmod u+x` again          |
| Script not found    | Check filename carefully       |
| Installation failed | Check internet / retry         |

---

