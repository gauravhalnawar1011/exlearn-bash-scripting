#!/usr/bin/env bash 
arr=(foo bar baz)
#printf '%s\n' "${arr[@]}" # this will print each element of the array on a new line
#printf '%s\n' "${arr[@]:1}" # this will print the elements of the array starting from the second element bar baz
printf '%s\n' "${arr[@]:0:2}" # this will print the first two elements of the array foo bar
printf '%s\n' "${arr[@]: -1}" # this will print the last element of the array baz
printf '%s\n' "${arr[@]: -2}" # this will print the last two elements of the array bar baz
printf '%s\n' "${arr[@]:1:-2}" # this will print the elements of the array starting from the second element and excluding the last element bar
echo "${arr[@]//a/o}" #  this will replace all a with o in the array elements and print them on a new line
echo "${arr[@]%z}" # this will remove the last character z from each element of the array and print them on a new line
echo "${arr[@]#b}" # this will remove the first character b from each element
printf '%s\n' helllo how are you # this will print each word on a new line

(IFS=_; echo "${arr[*]}") # this will print the elements of the array separated by _ instead of space
(IFS=_; echo ${arr[*]}) # "" are the externmly important to preserve the spaces in the elements of the array and print them on a new line

~             
