#!/bin/sh

#check for root user
if [ "$(id -u)" != "0" ]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

cd /usr

cd xenocara
rm -rf /usr/xobj/*
make bootstrap
make obj
make build

echo "xenocara finished"
