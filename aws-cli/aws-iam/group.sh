#!/bin/bash 

read -p "Enter an Group Name: " groupname 

aws iam create-group --group-name $groupname

for policy in \
	arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess \
	arn:aws:iam::aws:policy/AWSLambda_ReadOnlyAccess \
	arn:aws:iam::aws:policy/AmazonSNSReadOnlyAccess  
do 
	echo "attching policy to user $groupname"

	aws iam attach-group-policy \
		--group-name "$groupname" \
		--policy-arn "$policy" 

	if [ $? -eq 0 ]; then 
		echo "sucesss"
	else
		echo "FAILED"
	fi 

done 