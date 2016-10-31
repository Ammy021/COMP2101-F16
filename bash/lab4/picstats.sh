#!/bin/bash

# display the no of regular files present in the  Pictures directory
# amount of disk space used by the files
# also shows the sizes and names of the 3 largest files

### Variables
directory=~/Pictures
noOfFilesToShow=3

### Functions
function usage {
    echo "Usage: $0 [-h|--help] [-c|--count noOfFilesToDisplay] [directoryToWorkOn]"
    echo "Count defaults to 3, Directory defaults to ~/Pictures"
}

function error-message {
    echo "$@" >&2
}

### Command Line Processing
gotadirectory=no
while [ $# -gt 0 ]; do
    case "$1" in
    -h | --help ) # show usage diagram
        usage
        exit 0
        ;;
    -c | --count ) # specify how many big files to display
        if [[ $2 =~ ^[1-7][0-7]*$ ]]; then
            noOfFilesToShow=$2
            shift
        else
            usage
            error-message "number required during count"
            exit 1
        fi
        ;;
    * ) # grab the directory name to work on
    # if we haven't got a directory from the command line yet, this must be it
        if [ $gotadirectory = "no" ]; then
            directory=$1
            gotadirectory="yes"
    # otherwise this is some kind of command line garbage
        else
            usage
            error-message "'$1' is not understood  as a directory, I already have a directory $directory"
            exit 1
        fi
        ;;
    esac
    shift
done

### Main

echo -n "In the ~/Pictures directory, no of files are "
find $directory -type f |wc -l

echo -n "Those files use "
du -sh $directory |awk '{print $1}'

echo "The $numberOfFilesToShow largest files are:"
echo "========================"
du -h $directory/* |sort -h |tail -$numberOfFilesToShow
