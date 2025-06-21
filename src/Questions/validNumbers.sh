#! /bin/bash

p1=\([0-9][0-9][0-9]\)\ [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9];
p2=[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9];

while IFS= read -r line
do
    if [[ "$line" == $p1 ]]
    then
        echo "$line"
    elif [[ "$line" == $p2 ]]
    then
        echo "$line"
    fi
done < "${1:-/dev/stdin}"

# Leetcode 193