#!/bin/bash 

declare -A name

name=([name]=gaurav [course]=devops [duration]=6 [time]=8)

echo "the array first  element is the : ${name[name]}"
echo "the entrie array element are the : ${name[@]}"
echo "the length of an array is the : ${#name[@]}"
echo "${name[*]}"

