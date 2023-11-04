#!/bin/bash
cat words.txt | grep -E 'a' | grep -E 'e' | grep -v 'i' >> output_3.txt #3.7
