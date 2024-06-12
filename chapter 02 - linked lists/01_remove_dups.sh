#!/bin/bash

# since bash doesn't have linked list, so
# we solve it for an array. 

removeDuplicates() {
	# define variables as array
	local linkedList=("$@")
	local uniqueList=()

	# loop over chars to find unique ones
	for i in "${linkedList[@]}"; do
    	duplicate=false
		for j in "${uniqueList[@]}"; do    
			if [[ "$i" == "$j" ]]; then
                duplicate=true
                break
            fi
        done
		
        if ! "$duplicate"; then
			uniqueList[${#uniqueList[@]}]="$i"
		fi
    done

    echo "${uniqueList[@]}"
}

# get list of elements from user
linkedList=($@)

# remove duplicates
uniqueList=$(removeDuplicates "${linkedList[@]}")

# show unique list
echo "${uniqueList[@]}"
