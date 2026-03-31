#!/bin/bash 
USER_NAME='devops-user'
for policy in \
	arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess \
	arn:aws:iam::aws:policy/AWSLambda_ReadOnlyAccess \
	arn:aws:iam::aws:policy/AmazonSNSReadOnlyAccess 
do 
	echo "attching policy to user $USER_NAME"

	aws iam attach-user-policy \
		--user-name "$USER_NAME" \
		--policy-arn "$policy" 

	if [ $? -eq 0 ]; then 
		echo "sucesss"
	else
		echo "FAILED"
	fi 

done 


