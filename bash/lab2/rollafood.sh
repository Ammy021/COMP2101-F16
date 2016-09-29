#!/bin/bash

#Create an array containing 11 different food names.
#Create two variables with random numbers in them from 1-6 each.
#Add the two numbers together and use the sum as an index to
#display a food from your array

foods=(apple banana pizza wings beer steak sandwich "pop tart" chicken ribs dirt)
die1=$((1+ $RANDOM %6))
die2=$((1+ $RANDOM %6))
dicetotal=$((die1 + die2))
foodindex=$((dicetotal - 2))
echo "Yum, I rolled $dicetotal which gives me ${foods[foodindex]}!"
