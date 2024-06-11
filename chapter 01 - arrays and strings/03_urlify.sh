#!/usr/bin/bash

replaceSpaces() {
	str=$@
	result=""

	for ((i = 0; i < "${#str}"; i++)); do
		if [ "${str:i:1}" == " " ]; then
			result+="%20"
		else
			result+="${str:i:1}"
		fi
	done

	echo "$result"
}

replaceSpaces "$@"