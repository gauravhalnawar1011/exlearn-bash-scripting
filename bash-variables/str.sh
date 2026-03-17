#!/bin/bash 

name="gauRAV devops"
upper=${name^^}   # this will make the var in upper case GAURAV
lower=${name,,}  # this will make the var in the lower case gaurav 

echo "name is in the upper case is the : $upper"
echo "name is in the lower case is the : $lower"

reverse=$(echo "$name" | rev )

echo "the revrse string is the : $reverse"

string="hello from the exleran bash! course"

rev=$(echo "$string" | rev ) 

echo "the course is the in revrse order is the : $rev"

trimmed=$(echo "        hello            " | xargs)

echo "$trimmed"

prefix_rm=${string%bash!}

echo "prefix remove the bash : $prefix_rm"

name2=devops 

concate="$name $name2"

echo "helll from the $concate"

slice=${name:3:6}

echo "hello mr $slice"
myVar="hello world!"

prefix_remove=${myVar#hello}

echo "name after prefix is removed: $prefix_remove"


var="gaurav"

length=${#var}

echo "the length is the of var : $length"




name="hello devops"

replace=${name/hello/bye}

echo "$replace"



movie=kgf.sh

suff_rm=${movie%.sh}

echo "$suff_rm"
