!/bin/bash

#Description: Create lists of random MAC Addresses, redirects output to specified file name.
#Usage: ./mac.sh <Countds>

if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Please specify the number of MAC addresses to generate."
    exit 1
fi

read -p "Outful file name: " fileName

for ((i=1;i<=$1;i++)); do
    hexchars="0123456789ABCDEF"
    mac=$(echo -n $RANDOM | md5sum | sed -r 's/^(.{12}).*$/\1/;s/(..)/:\1/g;s/^://')
    echo $mac >> $fileName
done
