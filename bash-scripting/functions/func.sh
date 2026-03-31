#!/bin/bash 
<<'COMMENT'
greet() {
	echo "hello from exleran devops course"
}
greet

hello() {
	echo "hello guys how are you!"
}
hello


agrgumnet() {
echo "hello $1 $2 $3 $4"
}
agrgumnet Gaurav this side from
agrgumnet devops batch 20 how 
agrgumnet linux good is the 
agrgumnet k8s and devops course


sum() {
	echo "$(( $1 + $2))"
}
sum 12 12


greet() {
	local name=${1:-"guest"}
	echo "hello $name"
}
greet devops 

COMMENT

get_sum() {

	echo "hello devops"


}

get_sum
