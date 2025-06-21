#! /bin/bash

declare -i line_number=0
while IFS= read -r line
do
    ((line_number++))
    if (( line_number == 10 )); then
        echo "$line"
        exit 0
    fi
done < "${1:-/dev/stdin}"

# Leetcode 195