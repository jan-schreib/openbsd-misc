#!/bin/sh

#check for root user
if [ "$(id -u)" != "0" ]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

# regex shameless stolen
dq='"\([^"]*\)"'
sq="'\([^']*\)'"
sp="\([^ ]*\)"

ifc_match=''
conf_match=''
for m in "$dq" "$sq" "$sp"; do
    ifc_match="$ifc_match /^[[:space:]]*nwid $m chan.*/{s//\1/p;d;};"
done


if [ $# -ne 1 ]; then
	echo "Usage: wifiscan <interface>"
	exit 1
fi

results=
function scan {
	ifconfig $1 -bssid -chan -nwid -nwkey -wpa -wpakey down
	results=`ifconfig $1 scan | sed -ne "$ifc_match" | sort -u`
}

scan $1
i=1

echo ""
echo "# 	  Name"
echo "======================="

for wifi in $results; do
	echo "$i	  $wifi"
	i=$(( i+1 ))
done

echo ""
