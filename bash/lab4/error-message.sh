#!/bin/bash
#This script takes input from user and show error mesage on output

read -p "Type again invaild command? " errormessage

function error-message
{
    PROGNAME=$(basename $0)
	echo "${PROGNAME}: $errormessage" >&1 | tee | head -1
	exit 1
}

while [ $errormessage != "" ]; do
    echo "Error message"
    echo "$errormessage" | tee /dev/stderr | wc
    exit 1
done

