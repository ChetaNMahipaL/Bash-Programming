#!/bin/bash
input="$1"
output="$2"
tr '[:upper:]' '[:lower:]' < "$input" > "$output"
shuf "$output" >> temp.txt
mv temp.txt "$output"
