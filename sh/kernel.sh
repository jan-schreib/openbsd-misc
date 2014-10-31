#!/bin/sh

# updating the kernel

cd /usr/src/sys/arch/amd64/conf
config GENERIC.MP
cd ../compile/GENERIC.MP
make clean && make -j4
make install

echo "finished. you should reboot now"
