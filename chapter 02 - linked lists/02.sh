#!/bin/bash

# Initialize the linked list
declare -a list=("A" "B" "C" "A" "D" "B")

# Function to remove duplicates from an unsorted linked list
removeDuplicates() {
    local head=0
    local current=${list[$head]}
    local nextIndex=$((head + 1))

    declare -A seen

    seen[current]=1

    while ((nextIndex < ${#list})); do
        nextNode=${list[nextIndex]}

        if [[ -z ${seen[$nextNode]} ]]; then
            seen[$nextNode]=1
            nextIndex=$((nextIndex + 1))
        else
            # Skip over duplicate node
            list[nextIndex+1]=${list[nextIndex+2]}
            unset 'list[nextIndex]'
        fi
    done
}

# Call the function
removeDuplicates

# Print the modified linked list
for item in "${list[@]}"; do
    echo "$item"
done