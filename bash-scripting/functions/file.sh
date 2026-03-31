#!/bin/bash 
#

check_file() {
if [[ -e "$1" ]]; then 
	echo "file exists"
else
echo "not found"
	fi
}
check_file hello.txt

empty() {

	if [[ -s "$1" ]]; then 
		echo "not empty"
	else
		echo "file empty"
	fi 
}

empty hello.txt
