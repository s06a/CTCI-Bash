#!/bin/bash

compress() {
	# define variables
	local str=$1
	local compressed=""
	local counter=1

	# loop over string to count word frequency and compress the word
	for ((i = 0; i < ${#str}; i++)); do
		if [[ "${str:i:1}" == "$previous" ]]; then
			((counter++))
		else
			if [[ "$counter" -gt 1 ]]; then
				compressed="${compressed}${counter}${str:i:1}"
				counter=1
			else
				compressed="${compressed}${str:i:1}"
				counter=1
			fi
		fi
		previous=${str:i:1}
	done

	# echo the result
	[[ ${#compressed} -lt ${#str} ]] && echo "$compressed" || echo "$str"
}

compressed=$(compress "$1")
echo $compressed