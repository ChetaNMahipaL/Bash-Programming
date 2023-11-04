#!/bin/bash
path=$1
flag=$2
depth=$3
cd $path
    g=$(($depth))
recursive_step2()
{

array=$(ls -a)
for files in $array
do
if [ $files == ".." ]
then
hi=0
elif [ $files == "." ]
then
hi=0
else
for((i=0;i<$1;i++))
do
printf "|  "
done
printf "|--"
printf "$files\n"
if [[ -d "$files" ]]
then   
    cd $files
    printf "$(recursive_step2 $(($1+1)) $files)\n"
    cd ..
fi
fi
done

}
recursive_step1()
{
array=$(ls)
for files in $array
do
for((i=0;i<$1;i++))
do
printf "|  "
done
printf "|--"
echo "$files"
if [[ -d "$files" ]]
then
    
    cd $files
    printf "$(recursive_step1 $(($1+1)) $files)\n"
    cd ..
fi
done
}
c=$(( $g + 1))
recursive_step3()
{
    if [[  $1 != $c  ]]
    then
array=$(ls)
for files in $array
do
for((i=0;i<$1;i++))
do
printf "|  "
done
printf "|--"
printf "$files\n"
if [[ -d "$files" ]]
then
    
    cd $files
    
    printf "$(recursive_step3 $(($1+1)) $files)\n"
    
    cd ..
fi
done
fi
}

recursive_step6()
{
array=$(ls -lSr | awk '{print $9}' )
min=0
max=$(( ${#array[@]} -1 ))
for files in $array
do
for((i=0;i<$1;i++))
do
printf "|  "
done
printf "|--"
printf "$files\n"
if [[ -d "$files" ]]
then
    
    cd $files
    echo "$(recursive_step6 $(($1+1)) $files)"
    cd ..
fi
done
}

recursive_step5()
{
array=$(ls -r)
# printf $1"\n"
for files in $array
do
if [ $files == ".." ]
then
    hi=0
elif [ $files == "." ]
then
hi=0
else
for((i=0;i<$1;i++))
do
printf "|  "
done
printf "|--"
printf "$files\n"
if [[ -d "$files" ]]
then
    
    cd $files
    printf "$(recursive_step5 $(($1+1)) $files)\n"
    cd ..
fi
fi
done

}

if test "$flag" = "-A"
then
    echo "$(recursive_step2 0 $path)"
fi
if test "$flag" = ""
then
    echo "$(recursive_step1 0 $path)"
fi
if test "$flag" = "-D"
then
    echo "$(recursive_step3 0 $path)"
fi
if test "$flag" = "-s"
then
    echo "$(recursive_step6 0 $path)"
fi
if test "$flag" = "-a"
then
    echo "$(recursive_step1 0 $path)"
fi
if test "$flag" = "-d"
then
    echo "$(recursive_step5 0 $path)"
fi
