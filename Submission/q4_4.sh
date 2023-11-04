#!/bin/bash
input=$1
output=$2
count() {
  echo $1 | grep -oi '[aeiou]' | wc -l
}
for word in $(cat $input); do
  number=$(count $word)
  groups[$number]="${groups[$number]}$word"$'\n'
done
for i in ${!groups[@]}; do
  sorted_group=$(echo "${groups[$i]}" | sort -k1.1 -k1.2 -V)
  printf "%s" "$sorted_group" >> $output
  printf "\n" >> $output
done
sed '1d' $output > temp.txt
mv temp.txt "$output"
