#!/bin/bash 

count=1
<<'COMMENT'
while [ $count -le 5 ]; do 

	echo "count is $count"
	((count++))
done
COMMENT

read -p "Enter an table number: " num
i=1

while [ $i -le 10 ]; do 

	echo "alpha is $(($i * $num))"
	let i++

done 
