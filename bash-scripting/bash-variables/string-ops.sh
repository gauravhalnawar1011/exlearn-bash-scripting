#!/bin/bash
# -----------------------------------------------
# Bash String Operations Demonstration
# -----------------------------------------------

# Define variables
myVar="hello world!"
myVar2="WORLD"

# 1. String Length
length=${#myVar}       # Counts number of characters
echo "Length of myVar: $length"

# 2. Convert to Uppercase
upper=${myVar^^}
echo "Uppercase: $upper"

# 3. Convert to Lowercase
lower=${myVar2,,}
echo "Lowercase: $lower"

# 4. Replace Substring
replace=${myVar/world/friends}
echo "After Replacement: $replace"

# 5. String Slicing
slice=${myVar:0:5}     # Extracts substring (index 0 to 4)
echo "Sliced String: $slice"

# 6. String Concatenation
concat="$myVar $myVar2"
echo "Concatenation: $concat"

# 7. Index of Substring (position of 'world')
pos=$(expr index "$myVar" "world")
echo "Position of 'world': $pos"

# 8. Remove prefix
prefix_removed=${myVar#hello}   # Removes "hello" if present
echo "Prefix Removed: $prefix_removed"

# 9. Remove suffix
suffix_removed=${myVar%!}       # Removes last "!" if present
echo "Suffix Removed: $suffix_removed"

# 10. Trim leading/trailing whitespace
trimmed=$(echo "   hello   " | xargs)
echo "Trimmed String: '$trimmed'"

# 11. Reverse a String
reversed=$(echo "$myVar" | rev)
echo "Reversed String: $reversed"

# 12. Compare Strings
if [[ "$myVar" == "hello world!" ]]; then
  echo "Comparison: Strings are equal"
else
  echo "Comparison: Strings are NOT equal"
fi

# 13. Check if string contains substring
if [[ "$myVar" == *"world"* ]]; then
  echo "Contains Check: myVar contains 'world'"
fi

# 14. String Null/Empty Check
emptyStr=""
if [[ -z "$emptyStr" ]]; then
  echo "Empty Check: String is empty"
fi

# 15. Repeat string using printf
repeat=$(printf "%.0s*" {1..5})   # Print "*" 5 times
echo "Repeated String: $repeat"