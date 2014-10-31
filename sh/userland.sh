#!/bin/sh

# update userland

rm -rf /usr/obj/*
cd /usr/src
make obj

cd /usr/src/etc && env DESTDIR=/ make distrib-dirs

cd /usr/src
make build

echo "finished; check http://www.openbsd.org/faq/current.html"
