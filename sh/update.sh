#!/bin/sh

#check for root user
if [ "$(id -u)" != "0" ]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

#keep source tree on current

export CVSROOT=anoncvs@openbsd.cs.fau.de:/cvs

cd /usr
if [ ! -d src ]; then
	cvs -qd $CVSROOT get -P src
else
	cvs -d $CVSROOT up -Pd
fi
