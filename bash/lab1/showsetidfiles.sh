#!/bin/bash
#
# lists all the setuid and setgid regular files in the /usr directory tree

echo "SetUID files"
echo "-------------"
find /usr -type f -executable -perm -4000 -ls

cat <<EOF

Set GID files
-------------
EOF

find /usr -type f -executable -perm -2000 -ls
