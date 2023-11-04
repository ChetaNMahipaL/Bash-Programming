#!/bin/bash
strings=$(<words.txt) #3.5
for word in $strings
do
	rev=$(echo $word | rev)
if [ "$word" = "$rev" ]
then
	echo "$word" >> output_3.txt
fi
done
