#!/bin/bash

kthToLast() {
	k=$1
	
	remained=$(( ${#list[@]} - $k ))
	echo "${list[@]:$k:$remained}"
}

list=("A" "B" "C" "D" "E" "F" "G")

k=$1
[[ "${#list[@]}" -gt "$k" ]] && echo $(kthToLast $k)