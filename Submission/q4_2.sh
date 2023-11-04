#!/bin/bash
input="$1"
output="$2"
grep -i '[a-z].*[a-z].*[a-z]' "$input" > "$output"
