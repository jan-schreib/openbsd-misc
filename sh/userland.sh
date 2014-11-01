#!/bin/sh

#check for root user
if [ "$(id -u)" != "0" ]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

# update userland

rm -rf /usr/obj/*
cd /usr/src
make obj

cd /usr/src/etc && env DESTDIR=/ make distrib-dirs

cd /usr/src
make build

echo "finished; check http://www.openbsd.org/faq/current.html"
