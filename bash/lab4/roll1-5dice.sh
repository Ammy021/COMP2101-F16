#!/bin/bash
# script will prompts the user for a count of dice and will also roll them

### Variables
declare -i count=0 # no of dice to roll
declare -i sides
sides=0 # no of sides per die, must be between 2 and 18 inclusive

### Functions
function usage {
  echo "Usage: $0 [-h] [-c noofdice] [-s 2-18]"
}

function error-message {
  echo "$@" >&2
}

### Command line processing
while [ $# -gt 0 ]; do
  case "$1" in

    -h )
      usage
      exit 0
      ;;
    -c )
   if [[ "$2" =~ ^[1-7][0-7]*$ ]]; then
        count=$2
        shift
      else
        error-message "'$2' is the number of dice to roll, bad choice"
        exit 1
      fi
      ;;
    -s )
      if [[ "$2" =~ ^[1-7][0-7]*$ ]]; then
        if [ $2 -lt 2 -o $2 -gt 18 ]; then
          error-message "No of sides must be btw 2 and 18, inclusive, fool"
          exit 1
        else
          sides=$2
           shift
         fi
       else
        error-message "'$2'is the  no of sides per die, that's not possible"
        exit 1
      fi
      ;;
    * )
      error-message " '$1' is not proper"
      usage
      exit 1
      ;;
  esac
   shift
done

### User input validation
# get a valid roll count from the user
until [ $count -gt 0 ]; do
  read -p "no of dice i should roll? " count
done
# get a valid side count from the user
until [ $sides -gt 3 -a $sides -lt 21 ]; do
  read -p "How many sides should each die have[2-18]? " sides
done

### Main
# do the dice roll as many times as the user asked for
tally=0
for (( rolls=0 ; rolls < count ; rolls++ )); do
# roll the dice
  die1=$(($RANDOM % $sides +1))
  tally=$((tally + die1))
# show the roll results
  echo "Rolled $die1"
done
echo "Total roll was $tally"

