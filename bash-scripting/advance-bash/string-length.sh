#!/usr/bin/env bash 

s="hello from the exlearn tech"
for (( i=0; i<${#s}; i++));do  # this an c language style for loop this totally valid in bash 
	c=${s:$i:1} # default it 1  this denote the how char we need per line 
	echo "$c"
done 

# we can also do the 
echo "${s@A}" #  print entire string  with var name which in s in my case  
echo "${s@U}" # make the string uppercase
echo "${s@L}" # make the string lowercase


