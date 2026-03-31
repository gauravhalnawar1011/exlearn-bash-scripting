#!/usr/bin/env bash

process-indexed() {
	local arguments=("$@")
	echo "found: ${#arguments[@]} arguments"

	local IFS=,  # we can change the IFS to comma so that the arguments are separated by comma instead of space
	echo "${arguments[*]}"
}

process-associative() {  
	local arguments=("$@")
	echo "found: ${#arguments[@]} total arguments"

	declare -A unique
	local item
	for item in "${arguments[@]}"; do
		unique[$item]=1
	done

	echo "found: ${#unique[@]} unique arguments"
}

process-commands() {
	local arguments=("$@")
	echo "found: ${#arguments[@]} total arguments"

	local item
	for item; do
		echo "running command: $item"
		"$item" # execute the command by its name
        local status=$? # capture the exit status of the command
        echo "command '$item' exited with status: $status"  
	done
}

cmd=$1
echo "script called with arguments: $*"
shift # we shift the arguments so that the first argument is removed and the rest of the arguments are passed to the functions
echo "script shifted to arguments: $*"

case "$cmd" in
	indexed)
		process-indexed "$@"
		;;
	associative)
		process-associative "$@"
		;;
	commands)
		process-commands "$@"
		;;
	*)
		echo "unknown cmd: $cmd" >&2
		exit 1
		;;
esac


