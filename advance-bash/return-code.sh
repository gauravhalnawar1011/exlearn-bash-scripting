#!/usr/bin/env bash

uname 
var=$(uname)
code=$?
echo "uname returned: $code"
echo "$?" # 0 for success, non-zero for failure

my-function() {
    echo "hello world"
    return 42 # be mindful we use till 255 for return codes, as they are unsigned 8-bit integers
    # if we return a number greater than 255, it will be 0 due to overflow
}
var=$(my-function)
echo "my-function returned: $?"

# we can also do for the stdout of the function
stdout-function() {
    echo "this goes to stdout" >&1 # this same thing this might be confusing to us but this is how we redirect to stdout
    echo "this goes to stderr" >&2 # this is how we redirect to stderr  
    return 0
}
var=$(stdout-function)
var=$(stdout-function 2>/dev/null) # this will redirect stderr to /dev/null, so we won't see the error message
var=$(stdout-function 2>&1 >/dev/null) # this send output in dev null but give us error message in var
echo "stdout-function output: $var"


# get shell
cat /etc/passwd | grep $USER | cut -d: -f 7

declare -A shells
while IFS=: read -r name pass uid gecos home shell; do
   # skip comments
    if [[ $name == \#* ]]; then
        continue
    fi
    shells["$name"]="$shell"
done < /etc/passwd
echo "shell for $USER: ${shells[$USER]}"
