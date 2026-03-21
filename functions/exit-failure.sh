#!/bin/bash 
<<'COMMENT'
safe_run() {
	"$@" || {
		echo "command not found"
	exit 1 
}
}

safe_run ls /wrongdir



COMMENT

show_args() {
	echo "all args "$@""
	echo "count $#"
}
show_args a b c d e f 
