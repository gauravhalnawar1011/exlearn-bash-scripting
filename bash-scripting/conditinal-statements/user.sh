#!/bin/bash 

read -p "ENter Your Name: " name 

if [ -z "$name" ]; then 
       echo " please enter name $name"
else
  echo "your name is : $name"
fi  
