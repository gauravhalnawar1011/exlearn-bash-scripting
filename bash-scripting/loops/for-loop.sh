#!/bin/bash 
<<'COMMENT'
for c in {1..10}; do 
	echo " $c"

done 
COMMENT
<<'COMMENT'
for a in {a..z}; do 
	echo "hello $a"

done 
COMMENT
<<'COMMENT'
for i in {2..20..2}; do 
	echo "$i"
done

echo "================================"
for i in {3..30..3}; do 
	echo "$i"
done 




read -p "Enter an table number that you want to print : " num 
for i in {1..10}; do 

	echo "the table of the number  = $(($num * $i))"
done 
COMMENT


