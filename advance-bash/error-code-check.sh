#!/usr/bin/env bash 

ls /wrongdir 

if [ $? -ne 0 ]; then 
printf '\e[38;2;255;0;0m Command Failed \e[0m\n'
fi


ls 

printf '\e[38;2;0;255;0m Command sucesss \e[0m\n'



