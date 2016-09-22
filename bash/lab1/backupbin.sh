#!/bin/bash
#this script backs up my personal bin to my personal backup dictorary

rsync -avr ~/bin/ ~/backups
