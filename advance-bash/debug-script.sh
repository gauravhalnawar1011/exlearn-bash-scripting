#!/usr/bin/env bash

set -x # this for the deugging 
first_name='gaurav'
last_name='h'
 set +x
full_name="$first_name $last_name"

if [[ $first_name == 'gaurav' ]]; then
	echo "oh hey it's gaurav"
fi

echo "Hello $full_name!"
