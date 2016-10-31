#!/bin/bash

# This script showed procesed was halt by user if they enter wrong value

function help ()
{
    echo "This script is much indiviual illustrative. Lets see."
}

errormessage ()
{
    PROGNAME=$(basename $0)
	echo "${PROGNAME}: it do broke" >&2 | tee | head -1
	exit 1
}

while [ "$1" != "" ]; do
    case $1 in
    -h | --help )   usage
                    exit
                    ;;
    esac
done

read -p "final countdown time? " counttime

countdown=${1:-$counttime}
w=${#countdown}

while [ "$1" == "" ]; do
    echo "Invalid value";
    exit $errormessage
done

while [ $countdown >= 0 ]; do
    sleep 1 &
    printf "IT'S THE FINAL COUNTDOWN!!  %${w}d\r" "$countdown" 
    countdown=$(( $countdown - 1 ))
    wait
done

echo "You enter wrong value!"
exit 1
# script is over 
