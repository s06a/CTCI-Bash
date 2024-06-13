#!/bin/bash

kthToLast() {
	k=$1
	len=${#list[@]}
	remained=$(( len - k ))
	echo "${list[@]:$k:$remained}"
}

list=("A" "B" "C" "D" "E" "F" "G")

k=$1
[[ "${#list[@]}" -gt "$k" ]] && echo $(kthToLast $k)