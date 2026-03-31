#!/bin/bash

set -e  # Exit on error

echo "🔧 Installing dependencies..."

# Update packages
sudo yum update -y

# Install unzip if not present
sudo yum install -y unzip curl

echo "⬇️ Downloading AWS CLI..."

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

echo "📦 Extracting AWS CLI..."

unzip -o awscliv2.zip

echo "🚀 Installing AWS CLI..."

sudo ./aws/install

echo "✅ Verifying installation..."

aws --version

echo "🎯 AWS CLI installed successfully!"