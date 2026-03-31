#!/bin/bash 

file=./file.txt 

if [ -f $file ]; then 
	echo "file is present"
else
	echo "file is not present"
fi

dir=./file

if [ -d $dir ]; then
        echo "dir is present"
else
        echo "dir is not present"
fi

