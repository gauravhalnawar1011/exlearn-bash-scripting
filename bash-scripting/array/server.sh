#!/bin/bash 

servers=(ser1 ser2 ser3)

for srv in "${servers[@]}"; do 
	echo "connecting to $srv"
done 

