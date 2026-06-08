#!/bin/bash

echo "==================================="
echo " Terraform Cleanup Started"
echo "==================================="

BASE_DIR=$(pwd)

echo "Scanning in: $BASE_DIR"
echo

# show what will be deleted
echo "Files/Folders found:"
find "$BASE_DIR" \( \
    -type d -name ".terraform" -o \
    -type f -name ".terraform.lock.hcl" -o \
    -type f -name "terraform.tfstate" -o \
    -type f -name "terraform.tfstate.backup" \
\)

echo
read -p "Delete all above files? (yes/no): " confirm

if [[ "$confirm" == "yes" ]]; then
    find "$BASE_DIR" \( \
        -type d -name ".terraform" -exec rm -rf {} + -o \
        -type f -name ".terraform.lock.hcl" -delete -o \
        -type f -name "terraform.tfstate" -delete -o \
        -type f -name "terraform.tfstate.backup" -delete \
    \)

    echo
    echo "Cleanup completed successfully."
else
    echo
    echo "Cleanup cancelled."
fi