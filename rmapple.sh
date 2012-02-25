#!/bin/bash
# Name: Rotten Apples
# Author: Marissa Hogue <marissa@agathongroup.com>
# Last updated: 02/24/2012
# Find and delete __MACOSX/ directories

FILES=""

FILES=$(find . -type d -name "__MACOSX");
echo "${FILES[@]}";

if [ -n "$FILES" ];
then
    read -p "Delete these rotten apples? [y/N] " -r
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        /bin/rm -rf ${FILES[@]};
        echo "Done.";
    else
        echo "Okay, fanboy.";
    fi
else
    echo "No rotten apples found.";
fi
