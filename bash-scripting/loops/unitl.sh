#!/bin/bash 

# Until loop example
count=1
until [ $count -gt 599 ]; do
  echo "Count is $count"
  ((count++))
done

