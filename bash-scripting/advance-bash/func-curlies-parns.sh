#!/usr/bin/env bash

greet() {
     name=$1
    echo "hello $name!"
}

echo "before: $name"
greet devops 


# this also completly valid in bash 

 greet() (
     name=$1
     echo "hello $name!"
)
echo "After: $name"
greet devops
