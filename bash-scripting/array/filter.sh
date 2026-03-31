#!/bin/bash 

nums=(1 2 3 4 5 6 7 8 9)

for n in "${nums[@]}"; do
	(( n % 2 == 0 )) && echo "$n is even"
done 
nums[9]+=10


echo "the array element are the : ${nums[@]}"

