#!/bin/bash
#
# Made by Don Charisma 2018
#
# Do feel free to modify, use, distribute however you wish
# However, you do so accepting that :
# No liability WHATSOEVER rests with me in you using
# I'll only take credit for when it works, thanks !

# diskvscontroller.script.sh
# --------------------------
#
# I wrote this because I got bored hunting on stackoverflow and superuser
# looking for a simple and quick way to determine which of my disks
# were attached to which of my controllers
#
# Basically it's a quick and dirty query using udevadm
#
# Future improvements - Like to list the controller, then drives attached
# but it's simpler to query the drives then lookup controller each time
# - Like to have info presented a bit more concisely / orderly

# Tested - Debian Stretch 4.9.0-6-amd64 #1 SMP Debian 4.9.88-1+deb9u1 (2018-05-07) x86_64 GNU/Linux

for device in /sys/block/*
do
    DISKINFO=`udevadm info --query=property --path=$device`
    if echo "$DISKINFO" | grep -q ^ID_TYPE=disk
    then
	echo "****"
	echo "DISK"
	echo "----"
        echo "$DISKINFO" | grep ^DEVNAME=
	echo "$DISKINFO" | grep ^ID_MODEL=
	echo "$DISKINFO" | grep ^DEVLINKS=
	DEVPATH=`echo "$DISKINFO" | grep ^DEVPATH=`
	echo "$DEVPATH"
	echo "udevadm info --query=property --path=$device"
	CONTROLLERPATH=`echo "$DEVPATH" | sed -n 's/^DEVPATH=*//p' | sed -n 's/\(ata\|host\|usb\).*//p'`
	CONTROLLERINFO=`udevadm info --query=property --path=$CONTROLLERPATH`
	echo ""
	echo "CONTROLLER"
	echo "----------"
	echo "CONTROLLERPATH=$CONTROLLERPATH"
	echo "$CONTROLLERINFO" | grep ^DRIVER=
	echo "$CONTROLLERINFO" | grep ^ID_MODEL_FROM_DATABASE=
	echo "udevadm info --query=property --path=$CONTROLLERPATH"
	echo ""
	echo ""
	
    fi
done


