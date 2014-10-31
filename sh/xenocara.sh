#!/bin/sh

# update xenocara

export CVSROOT=anoncvs@openbsd.cs.fau.de:/cvs

cd /usr
if [ -d xenocara ]; then
	cvs -qd$CVSROOT checkout -P xenocara
else
	cvs -d $CVSROOT up -Pd
fi

cd xenocara
rm -rf /usr/xobj/*
make bootstrap
make obj
make build

echo "xenocara finished"
