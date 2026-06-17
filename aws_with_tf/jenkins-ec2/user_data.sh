#!/bin/bash

# Log everything
exec > >(tee /var/log/user-data.log)
exec 2>&1

set -eux

# Update OS
dnf update -y

# Install prerequisites
dnf install -y wget java-21-amazon-corretto

# Verify Java
java --version

# Import Jenkins GPG Key
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Download official Jenkins repository file
wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/rpm-stable/jenkins.repo

# Clean metadata
dnf clean all
dnf makecache

# Install Jenkins
dnf install -y \
jenkins \
docker \
git 


# Start Jenkins
systemctl start docker
systemctl enable docker
systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins


# Wait for startup
sleep 15

# Display status
systemctl status jenkins --no-pager

usermod -aG docker jenkins

systemctl restart jenkins
usermod -aG docker jenkins
# Save initial password to a file for easy access
cat /var/lib/jenkins/secrets/initialAdminPassword > /home/ec2-user/jenkins-password.txt
chown ec2-user:ec2-user /home/ec2-user/jenkins-password.txt
