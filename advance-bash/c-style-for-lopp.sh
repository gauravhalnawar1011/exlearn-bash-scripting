#!/usr/bin/env bash 

max=4
for (( i=1; i<=max; i++ )); do
    echo "Number: $i" # this will work because the for loop will evaluate the variable max and use it in the loop condition
done

max=4
for (( i=1; i<=max; i+=2 )); do
    echo "Number: $i" # this will work because the for loop will evaluate the variable max and use it in the loop condition
done


