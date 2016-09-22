#!/bin/bash

# display how many regular files there are in the Pictures directory 
# how much disk space they use. It should also show the sizes
# and names of the 3 largest files

echo -n "in the ~/Pictures directory, the no of files are " 
find ~/Pictures -type f |wc -l

echo -n "Those file use "
du -h ~/Pictures |awk '{print $1}'

echo "The 3 largest files are: "
echo "========================="
du -h ~/Pictures/* |sort -h |tail -3
