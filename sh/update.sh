#!/bin/sh

#keep source tree on current

export CVSROOT=anoncvs@openbsd.cs.fau.de:/cvs

cd /usr
if [ ! -d src ]; then
	cvs -qd $CVSROOT get -P src
else
	cvs -d $CVSROOT up -Pd
fi
