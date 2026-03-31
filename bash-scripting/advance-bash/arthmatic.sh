# arithamaic operators in bash are used to perform arithmetic operations on numbers. The basic arithmetic operators are:
# + : addition
# - : subtraction
# * : multiplication            
# / : division
# % : modulus (remainder)
# ** : exponentiation   
# The syntax for using arithmetic operators in bash is as follows:
# $(( expression ))
# For example, to add two numbers, you can use the following command:
# result=$(( 5 + 3 ))
# echo $result # Output: 8
# You can also use variables in the expression. For example:
# a=5
# b=3
# result=$(( a + b ))
# echo $result # Output: 8      


#Arithmatic  Experession 

echo ((  45 * 2 ))

a=2 
b=3

echo $(( a + b ))


i=0 
((i++))

echo "i is $i"


i=2
(( i *=5))
echo "i is $i"


i=2
(( i >=5))
echo "i is $i"


i=2
(( i <=5))
echo "i is $i)


# help let 

Ternary operators 

a=2
b=6
((max = a > b ? a : b))

echo "max = $max"


# set -x is used to enable debugging mode in bash. When set -x is enabled, bash will print each command and its arguments to the terminal before executing it. This can be useful for troubleshooting and understanding the flow of a script.
# To enable debugging mode, you can use the following command:
# set -x
# To disable debugging mode, you can use the following command:
# set +x    
# set -u is used to treat unset variables as an error when performing parameter expansion. When set -u is enabled, if you try to use an unset variable, bash will print an error message and exit the script. This can help catch typos and prevent unintended behavior in your scripts.
# To enable this behavior, you can use the following command:
# set -u
# To disable this behavior, you can use the following command:
# set +u    


a=07
echo "$a"
echo $((a ))

# we use this kind of setup to avoid the octal interpretation of numbers with leading zeros. By using the $(( )) syntax, we can ensure that the number is treated as a decimal value, even if it has leading zeros.
# be aware with leading zeros in numbers, as they can be interpreted as octal values in bash. To avoid this, you can use the $(( )) syntax to ensure that the number is treated as a decimal value.
# there is way we can enforce it we can do the 10#$a before the number to explicitly specify that it should be treated as a decimal value. For example:
a=010
echo "$a"
echo $((10#$a))
