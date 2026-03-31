#!/bin/bash

echo "Home directory: $HOME"
echo "Current user: $USER"
echo "Current shell: $SHELL"
echo "Present working directory: $PWD"
echo "Hostname: $HOSTNAME"
echo "Process ID of this script: $$"

HOSTNAME=$(hostname)

echo "the user currently using host is : $HOSTNAME"

readonly DOB=05/06/2001

echo "the current user DOB is: $DOB"