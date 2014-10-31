#!/bin/sh

#keep source tree on current

export CVSROOT=anoncvs@openbsd.cs.fau.de:/cvs

if [ ! -d /usr/src ]; then
	cd /usr
	cvs -qd $CVSROOT get -P src
else
	cd /usr
	cvs -d $CVSROOT up -Pd
fi
