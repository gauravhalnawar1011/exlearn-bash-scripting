#!/usr/bin/env bash

name=$1

# we can se the default value for a variable using parameter expansion

name=${1:-"World"} # this will set name to "World" if $1 is not set or is null
name=${1?'No name provided'} # this will throw an error if the variable is not set
echo "Hello, $name!"
echo "done"
