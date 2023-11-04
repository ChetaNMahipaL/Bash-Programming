#!/bin/bash
input="$1"
output="$2"
grep -v "j" "$input" > "$output" 
