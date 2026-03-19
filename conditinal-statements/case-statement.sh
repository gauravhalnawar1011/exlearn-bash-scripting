#!/bin/bash

read -p "Enter  a Day (mon/tue/wed/thu/fri/sat/sun: " day


case $day in
	mon) echo "Today is Monday: $day";;
	tue) echo "Today is Tuesday:";;
	wed) echo "Today is wednsday:";;
	thu) echo "Today is thursday:";;
	fri) echo "Today is Friday:";;
	sat) echo "Today is Saturday:";;
	sun) echo "Today is Sunday:";;
	*) echo "Invalid Input" ;;
esac
