#!/bin/bash 

for i in {1..10}; do
	if [ $i -eq 6 ]; then 
		continue

	fi
	echo "$i continue"

done

