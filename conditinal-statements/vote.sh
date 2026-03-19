#!/bin/bash 

echo "Enter an Your Age: "
read age 

if [ $age -le 18 ]; then 
	echo "the age is the less than the 18, sorry your not eligibe to vote you enter an $age"
elif [ $age -eq 18 ]; then 
	echo "wow your eligible to vote . your enterd age : $age"

elif [ $age -lt 0 ]; then 
	echo "your ENterd an wrong age age can not be an negative: you enterd age $age"
elif [ $age -eq 25 ]; then 
	echo "congrts on silver jubleee : $age"
elif [ $age -eq 50 ]; then
	echo "congrts on golden jublee: $age"

fi 
