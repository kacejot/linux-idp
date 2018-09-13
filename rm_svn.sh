#!/bin/bash

target_path=$1

if [ ! -e $target_path ]
then
    echo "The specified path does nost exist"
    exit 1
fi

if [ ! -d $target_path ]
then
    echo "Path to folder expected as argument"
    exit 1
fi

if [ ! -w $target_path ]
then
    echo "The path is write-protected"
    exit 1
fi

echo "Deleting .svn files..."
rm $target_path/*.svn

echo "Compressing the target folder..."
tar -czvf compressed.tar.gz $target_path

if [ $? -eq 0 ]
then 
    echo "Done."
else
    echo "Done with errors during compressing."
    exit $?
fi"
