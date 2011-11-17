#!/bin/bash
# Author: Marissa Hogue <marissa@agathongroup.com>
# Last updated: 11/15/2011
# Pipes various 'svn diff' output to vim

show_usage() {
    echo "Usage: svnd <revision> <file>"
    echo
    echo "Examples:"
    echo "  svnd                    # get diff for working copy"
    echo "  svnd 42                 # get diff for r42"
    echo "  svnd somefile.php       # get diff for somefile.php"
    echo "  svnd 42 somefile.php    # get diff for somefile.php in r42"
    exit
}

# show usage if '-h' or '--help' is the first argument
case $1 in
    ("-h"|"--help") show_usage ;;
esac

# svnd
if [[ $# == 0 ]] ; then
    svn diff | vim -R -

# svnd <revision>
elif [ $# == 1 ] && [[ $1 == ${1//[^0-9]/} ]] ; then
    svn diff -c $1 | vim -R -

# svnd <file>
elif [ $# == 1 ] && [ -f $2 ] && [ -e $2 ] ; then
    svn diff $1 | vim -R -

# svnd <revision> <file>
elif [ $# == 2 ] && [[ $1 == ${1//[^0-9]/} ]] && [ -f $2 ] && [ -e $2 ] ; then
    svn diff -c $1 $2 | vim -R -

# no arguments or incorrect arguments
else
    echo "Type 'svnd -h or svnd --help' for usage."
fi
