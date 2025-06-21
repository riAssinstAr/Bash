#! /bin/bash

declare -A word_count
while IFS= read -r line
do
    for word in $line; 
    do
        word=$(echo "$word" | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]')
        ((word_count["$word"]++))
    done
done < "${1:-/dev/stdin}"

for word in "${!word_count[@]}"; 
do
    echo "$word ${word_count[$word]}"
done | sort -k2,2nr -k1,1

# Leetcode 192
# awk '
# {
#     for (i=1; i<=NF; i++) { 
#         freq[$i]++
#     }
# }
# END {
#     for (w in freq) {
#         print w, freq[w]
#         }
# }' words.txt | sort -k2, 2nr