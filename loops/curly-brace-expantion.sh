#!/usr/bin/env bash

filename='myfile'
echo "$filename".{txt,md} # this will expand to myfile.txt and myfile.md
arr=(  "$filename."{txt,md} ) # this will create an array with two elements: myfile.txt and myfile.md
for item in "${arr[@]}"; do
    echo "$item"
done

# we can also do the things like this 
arr=(/tmp/{foo,bar}/{1,2,3}.txt)
for item in "${arr[@]}"; do
    echo "$item"
done



