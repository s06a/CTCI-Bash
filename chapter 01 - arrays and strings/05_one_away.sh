#!/bin/bash

isOneEditAway() {
	str1=$1
	str2=$2
	diffs=0

	# sort and lower case strings and also remove spaces
	str1=$(echo "$str1" | tr '[:upper:]' '[:lower:]' | sort | tr -d ' ')
	str2=$(echo "$str2" | tr '[:upper:]' '[:lower:]' | sort | tr -d ' ')
	
	# define length
	len1=${#str1}
	len2=${#str2}
	
	# check if more than one difference
	[[ $((len1 - len2)) -gt 1 || $((len2 - len1)) -gt 1 ]] && return 1

	# define min length
	len=$((len1 < len2 ? len1 : len2))

	
	# loop to calculate number of differences
	for ((i = 0; i < len; i++)); do
		if [[ "${str1:$i:1}" != "${str2:$i:1}" ]]; then
			diffs+=1
		fi
	done

	[[ $diffs -gt 1 ]] && return 1 || return 0
}

isOneEditAway "$1" "$2"
result=$?

[[ $result -eq 0 ]] && echo "one edit away!" || echo "not one edit away!"
