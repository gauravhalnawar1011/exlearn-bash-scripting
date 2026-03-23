#!/bin/bash

linux_distros=("fedora" "redhat" "ubuntu" "kali" "open-suse" "centos" "archlinux")

echo "the array all element are: ${linux_distros[@]}"
echo "the length of an array is the : ${#linux_distros[@]}"
echo "the all index of an array is : ${!linux_distros[@]}"
echo "the  0th index name is the: ${linux_distros[0]}"
echo "the  1nd index name is the: ${linux_distros[1]}"
echo "the 2nd index name is the: ${linux_distros[2]}"
