#!/bin/bash 
<<'COMMENT'
num=10 

if [ $num -eq 8 ]; then 
	echo "number is the $num"
else
	echo "number is : $num"
fi
COMMENT
echo "ENter an Number : "
read num
#num=101


if [ $num -eq 10 ]; then 
	echo "number is exactly 10"
elif [ $num -lt 10 ]; then 
	echo "number is the less than 10 and you enterd an num $num"
elif [ $num -gt 10 ]; then 
	echo "the number is greter than 10 you enterd an  $num" 
fi
