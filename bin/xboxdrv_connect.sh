#!/bin/bash

## This shell script takes arguments from udev rules.
## $2 should be the symlink name of the event associated with the connected controller.
## This script runs xboxdrv using the config file of the same name located in the directory of your choice.

LOGFILE="/var/log/xboxdrv.log"
CONFIG_DIR="/etc/xboxdrv/"

## Only useful for one game, of which I'm aware. Risk of Rain expects the first player
## to be on /dev/input/js0.
## Because js0 is often taken by another module, this shifts down the js numbering scheme. 
## In my case, I created a udev rule to delete the joystick device, so that only xbox 
## controllers should be detected.

decrement_js()
{
    sleep 2

        cd /dev/input/

    for i in $(ls | grep "js[0-9]" )
    do
    	pos=$( echo $i | cut -c 3)
    	pos=$(($pos-1))
        
    	for j in `seq 0 $pos`
    	do
    		if [ ! -e "js$j" ]
    		then
    			mv $i "js$j"
    			break;
    		fi
    	done
    done

}


## xboxdrv must be started slightly differently if using a PS3 controller.

if [ "$2" == "ps3_usb_pad" ]
then
    EXTRA_ARGS=""
else
    EXTRA_ARGS="--evdev /dev/input/$2"    
fi


if [ "$1" == "add" ]
then

    xboxdrv $EXTRA_ARGS -c $CONFIG_DIR/$2.xboxdrv& >> $LOGFILE
    echo "$2 was connected." >> $LOGFILE
    #decrement_js


elif [ "$1" == "rm" ]
then

    pkill --signal 1 -f "xboxdrv $EXTRA_ARGS -c $CONFIG_DIR/$2.xboxdrv"
    echo "$2 was disconnected properly." >> $LOGFILE

else

    echo "Undefined argument given." >> $LOGFILE
fi

