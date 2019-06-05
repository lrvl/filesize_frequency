#!/bin/bash

#
# Function: Replace all but first digit with zeros
#
zerofy() {
	t="${1:0:1}${1//[0-9]/0}"
	echo "${t%?}"
}

#
# Function: Find filesizes of all files
#
get_filesizes() {
	for filesize in $(find . -type f -ls | awk '{print $7}')
	do
		zerofy "${filesize}"
	done
}

#
# Function: Count frequency 
#
awk_valuecounter() {
	awk -F, '{a[$1]++;}END{for (i in a)print i","a[i];}'
}

# Results using awk
get_filesizes | awk_valuecounter
# Results sorted without using awk but uniq to count
get_filesizes | sort | uniq -c
