#!/bin/bash
printf "Enter Name: " 
read name
printf "Enter DOB: "
read dob1 dob2
cm=$(date '+'%m)
cy=$(date '+'%Y)
dob1=$((10#$dob1))
v1=$(( 13 - $dob1 + $cm))
v2=$(( $cy - $dob2 - 1))
v3=$(( $v2 * 12 ))
v4=$(( $v1 + $v3))
echo "Hello $name, your age is $v4 months"
