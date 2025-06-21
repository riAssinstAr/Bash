#! /bin/bash

ROWS=()
while IFS=' '; read -a columns; 
do
    i=0
    for col in "${columns[@]}"; 
    do
        if [ -z "${ROWS[$i]}" ]; 
        then
            ROWS[$i]="$col"
        else
            ROWS[$i]+=" $col"
        fi
        ((i++))
    done
done < "${1:-/dev/stdin}"

for row in "${ROWS[@]}"; 
do
    echo "$row"
done

# Leetcode 194
# awk '
# {
#     for (i = 1; i <= NF; i++) {
#         a[i] = a[i] ? a[i] " " $i : $i
#     }
# }
# END {
#     for (i = 1; i <= length(a); i++) {
#         print a[i]
#     }
# }' file.txt