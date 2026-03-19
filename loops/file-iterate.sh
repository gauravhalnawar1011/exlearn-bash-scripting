#!/bin/bash 

file_path=./file.txt 
IFS=$'\n'
for file in $(cat $file_path); do
	echo "$file"
done

