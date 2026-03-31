#!/bin/bash 

output_dir="table"
<<'COMMENT'
create_dir() {
	mkdir -p "$output_dir"
}
create_dir
COMMENT

genrate_table(){
	local num=$1
	local file="$output_dir/${num}-table.txt"

	{
		echo "multiplcation table for the $num"
		echo "--------------------------------"

		for i in $(seq 1 10); do 
			echo "$num X $i = $((num * i))"
		done
	} > $file
echo "created $file"
}
main() {
for n in $(seq 1 10); do 
	genrate_table "$n"
done 

echo "all table genarted in = $output_dir"
}

main "$@"
