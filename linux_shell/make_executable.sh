#!/bin/bash

target_path=$1
logfile=$2


my_full_path=$(realpath $0)

if [[ -z "$1" ]]
then 
    target_path=$PWD
fi

if [[ -z "$2" ]]
then
    logfile="log.txt"
fi

if [[ ! -e $target_path ]]
then
    echo "The specified path does nost exist"
    exit 1
fi

if [[ ! -d $target_path ]]
then
    echo "Path to folder expected as argument"
    exit 1
fi

if [[ ! -w $target_path ]]
then
    echo "The path is write-protected"
    exit 1
fi

for file in $target_path/*.sh
do
    if [[ "$file" == "$my_full_path" ]]
    then 
        echo "Skipping myself..."
        continue
    fi

    if [[ -x $file ]]
    then
        echo "$file is already executable. Skipping..."
        continue
    fi

    echo "Making $file executable..."
    chmod +x $file
    
    if [[ $? -eq 0 ]] 
    then
        echo "Success"
        echo "$file is now executable">>$logfile
    else 
        echo "Failed to make $file executable."
    fi
done
