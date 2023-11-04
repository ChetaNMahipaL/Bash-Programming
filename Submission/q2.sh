#!/bin/bash

while getopts ":C:f:l:n:o:k:adc:v:" opt; do
  case $opt in
C)
	Operation=$OPTARG
	;;

f)
	fname=$OPTARG
	;;
l) 
	lname=$OPTARG
	;;
n)
	contact=$OPTARG
	;;
o)
	office=$OPTARG
	;;
k)
	modify=$OPTARG
	;;
a)
	sort='a'
	;;
d)
	sort='d'
	;;
c)
	column=$OPTARG
	;;
v)
	search=$OPTARG
	;;

    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done
function Insert()
{
                results=$(grep -i "$1," contacts.csv | cut -d',' -f1-4)
                if [ -n "$results" ]; 
                then
                echo "Unable to insert contact!"
                else
			flag="1"
                fi
	if [ "$flag" = "1" ]
	then
		ifname=$1  
                ilname=$2  
                icontact=$3
                ioffice=$4
                printf "%s," $ifname >> contacts.csv  
                printf "%s," $ilname >> contacts.csv  
                printf "%s," $icontact >> contacts.csv
                printf "%s\n" $ioffice >> contacts.csv
	fi	
}
function Display()
{
	cat contacts.csv | head -n 1
	if [ "$1" = "a" ]
	then
		cat contacts.csv | tail -n +2 | sort -k 1,1
	elif [ "$1" = "d" ]
	then
		cat contacts.csv | tail -n +2 | sort -r -k 1,1 
	else
		cat contacts.csv | tail -n +2
	fi
}
function Delete()
{
	sed -i "/^$1,/d" contacts.csv

}
function Search()
{
	if [ "$1" = "fname" ]
	then
		results=$(grep -i "$2," contacts.csv | cut -d',' -f1-4)
		if [ -n "$results" ]; 
		then
		cat contacts.csv | head -n 1
  		echo "$results"
		else
  		echo "No results found!"
		fi
	fi
	if [ "$1" = "lname" ]
        then     
                results=$(grep -i ",$2," contacts.csv | cut -d',' -f1-4)
                if [ -n "$results" ];
                then
		cat contacts.csv | head -n 1
                echo "$results"
                else
                echo "No results found!"
                fi
        fi
	if [ "$1" = "mobile" ]
        then     
                results=$(grep -i ",$2," contacts.csv | cut -d',' -f1-4)
                if [ -n "$results" ];
                then
		cat contacts.csv | head -n 1
                echo "$results"
                else
                echo "No results found!"
                fi
        fi
	if [ "$1" = "office" ]
        then     
                results=$(grep -i ",$2" contacts.csv | cut -d',' -f1-4)
                if [ -n "$results" ];
                then
		cat contacts.csv | head -n 1
                echo "$results"
                else
                echo "No results found!"
                fi
        fi
}
function Edit()
{
    contact=$(grep -i "^$1," contacts.csv)
    
    if [ -n "$2" ]; then
        contact=$(echo "$contact" | sed "s/^$1/$2/i")
    fi
    
    if [ -n "$3" ]; then
        contact=$(echo "$contact" | awk -F',' -v ln="$3" '{OFS=","; $2 = ln; print }')
    fi
    
    if [ -n "$4" ]; then
        contact=$(echo "$contact" | awk -F',' -v cn="$4" '{OFS=","; $3 = cn; print }')
    fi
    
    if [ -n "$5" ]; then
        contact=$(echo "$contact" | awk -F',' -v c="$5" '{OFS=","; $4 = c; print }')
    fi
    
    sed -i "s/^$1.*/$contact/" contacts.csv
}
if [ "$Operation" = "insert" ]
then
	Insert $fname $lname $contact $office
fi
if [ "$Operation" = "display" ]
then
	Display $sort
fi
if [ "$Operation" = "delete" ]
then 
	Delete $modify
fi
if [ "$Operation" = "search" ]
then
	Search $column $search
fi
if [ "$Operation" = "edit" ]
then
	Edit $modify $fname $lname $contact $office
fi
