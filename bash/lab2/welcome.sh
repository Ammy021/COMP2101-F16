!/bin/bash

# This script prints out a welcome message using variables and command substitution

export MYNAME="Ammy Gill"
mytitle="Supreme Commander"

plant=`hostname`
weekday=$(date +%A)
echo "Welcome to planet $myhostname, $mytitle $MYNAME!"
echo "Today is $weekday."

