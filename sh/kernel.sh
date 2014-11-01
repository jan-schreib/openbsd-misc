#!/bin/sh

#check for root user
if [ "$(id -u)" != "0" ]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

# update the kernel

cd /usr/src/sys/arch/amd64/conf
config GENERIC.MP
cd ../compile/GENERIC.MP
make clean && make -j4
make install

echo "finished. you should reboot now"
