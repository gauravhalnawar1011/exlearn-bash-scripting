#!/bin/bash 
read -p "Enter an Number to check even or odd: " num
check_even(){
	if (( $1 % 2 == 0 )); then 
		return 0
	else 
		return 1
	fi 
}

check_even $num && echo "Even" || echo "odd"

