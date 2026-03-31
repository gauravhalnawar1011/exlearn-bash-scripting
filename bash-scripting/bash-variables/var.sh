#!/bin/bash 

<<'COMMENT' 
echo "the script name is the $0"
echo "hello my name is $1"

echo "hello i am enrolled in $2"

echo "$3 is the grest os"

echo "$4 is the unix like os"
echo "all argument $@"

echo "all argument postion total $#"
COMMENT
 


username=$(whoami)

echo "the current user is logged  in the is $username"

PWD=$(pwd) 

echo "the current working dir is $PWD"

echo "today date is the $(date)"

echo " the current dir has the files: $(ls)"

echo "hello the home dir is $HOME"

echo "the process id for the script is : $$"

