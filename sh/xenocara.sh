#!/bin/sh

# update xenocara

export CVSROOT=anoncvs@openbsd.cs.fau.de:/cvs

cd /usr
cvs -qd$CVSROOT checkout -P xenocara

cd /usr/xenocara
rm -rf /usr/xobj/*
make bootstrap
make obj
make build

echo "xenocara finished"
