#!/bin/bash
strings=$(<words.txt) #3.6
for word in $strings
do
if echo "$word" | grep -q '\(.\).*\1';
then
	printf ""
else
	echo "$word" >> output_3.txt
fi
done
