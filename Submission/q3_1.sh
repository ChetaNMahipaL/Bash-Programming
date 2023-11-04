#!/bin/bash
cat words.txt | grep -E '\bs' | grep -v '^sa' >> output_3.txt #3.1
