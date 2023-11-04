#!/bin/bash
cat words.txt | grep -i '^[aeiou].*[^aeiou]$' >> output_3.txt #3.8 
