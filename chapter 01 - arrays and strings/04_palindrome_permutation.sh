#!/bin/bash

isPalindromePermutation() {
	str=$@
	declare -A chars

	str=$(echo "$str" | tr '[:upper:]' '[:lower:]')

	for ((i = 0; i < ${#str}; i++)); do
		char=${str:i:1}
		chars[$char]=$(( ${chars[$char]:0} + 1 )) # 0 as default value if no value
	done

	odd=0
	for val in "${chars[@]}"; do
		if [[ $(( $val % 2 )) -ne 0 ]]; then
			odd+=1
		fi
	done

	[[ $odd -le 1 ]] && return 0 || return 1
}

isPalindromePermutation "$@"
result=$?

[[ $result -eq 0 ]] && echo "it's a permuted palindrome" || echo "it's not a permuted palindrome"