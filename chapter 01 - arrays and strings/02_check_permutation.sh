#!/usr/bin/bash

isPermutation() {
    str1=$1
    str2=$2
	
	# check if equal length
    [[ "${#str1}" != "${#str2}" ]] && return 1

	# sort chars
    sortedStr1=$(echo "$str1" | sort)
    sortedStr2=$(echo "$str2" | sort)
	
	# check if permutation
    [[ "$sortedStr1" == "$sortedStr2" ]] && return 0 || return 1
}

# read args
isPermutation "$1" "$2"

# get status code of function
result=$?

[[ "$result" == 0 ]] && echo "are permutated" || echo "not permuted"
