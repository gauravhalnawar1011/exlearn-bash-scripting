#!/bin/bash 

username="devops-user"

aws iam create-user --user-name $username 

for policy in \
	arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess \
	arn:aws:iam::aws:policy/AWSLambda_ReadOnlyAccess \
	arn:aws:iam::aws:policy/AmazonSNSReadOnlyAccess  
do 
	echo "attching policy to user $username"

	aws iam attach-user-policy \
		--user-name "$username" \
		--policy-arn "$policy" 

	if [ $? -eq 0 ]; then 
		echo "sucesss"
	else
		echo "FAILED"
	fi 

done 
