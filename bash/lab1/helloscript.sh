#!/bin/bash

#helloscript.sh - this script displays the string "Hello World!"
#it takes no input

#this is a really way of creating the output string
echo -n "helb world" |sed -e "s/b/o/g" -e "s/l/ll/" -e "s/ol/orl/" |tr "h" "H"|tr "w" "W"|awk '{print $1 "\x20" $2 "\41"}'
