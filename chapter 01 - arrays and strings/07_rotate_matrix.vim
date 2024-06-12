rotateImage() {
    local -n matrix=$1
    local n=${#matrix[@]}

    for (( layer = 0; layer < n / 2; layer++ )); do
        local first=$layer
        local last=$(( n - 1 - layer ))

        for (( i = $first; i < $last; i++ )); do
            local offset=$(( i - first ))
            
            local top=(${matrix[$first,$i]})
            local right=(${matrix[$i,$last]})
            local bottom=(${matrix[$last,$(( last - offset ))]})
            local left=(${matrix[$(( last - offset )),$first]})

            # Rotate the 4 bytes of each pixel
            matrix[$first,$i]=${left[0]} ${left[1]} ${left[2]} ${left[3]}
            matrix[$i,$last]=${top[0]} ${top[1]} ${top[2]} ${top[3]}
            matrix[$last,$(( last - offset ))]=${right[0]} ${right[1]} ${right[2]} ${right[3]}
            matrix[$(( last - offset )),$first]=${bottom[0]} ${bottom[1]} ${bottom[2]} ${bottom[3]}
        done
    done
}

# Example NxN matrix representing an image (3x3 matrix)
declare -A image=(
    [0,0]=1 [0,1]=2 [0,2]=3
    [1,0]=4 [1,1]=5 [1,2]=6
    [2,0]=7 [2,1]=8 [2,2]=9
)

echo "Original Image:"
for (( i = 0; i < 3; i++ )); do
    for (( j = 0; j < 3; j++ )); do
        echo -n "${image[$i,$j]} "
    done
    echo
done

rotateImage image

echo "Rotated Image:"
for (( i = 0; i < 3; i++ )); do
    for (( j = 0; j < 3; j++ )); do
        echo -n "${image[$i,$j]} "
    done
    echo
done