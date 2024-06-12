#!/bin/bash

isSubstring() {
	str1=$1
	str2=$2

	[[ "$str2" == *"$str1"* ]] && return 0 || return 1
}

isSubstring "$1" "$2"
result=$?

(( $result == 0 )) && echo "yes" || echo "no" 