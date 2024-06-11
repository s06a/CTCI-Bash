#!/usr/bin/bash

isUnique() {
	local str=$1
	declare -A chars

	for ((i = 0; i < ${#str}; i++)); do
		char=${str:i:1}
		if [[ ${chars[$char]} ]]; then
			return 1
		fi
		chars[$char]=1
	done

	return 0
}

isUnique "$1"
result=$?

if [[ "$result" == 0 ]]; then
	echo "string characters are unique"
else
	echo "string characters are not unique"
fi