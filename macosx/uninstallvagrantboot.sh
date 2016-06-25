#!/bin/bash


#set up variables
LOGNAME=$(logname)
PLISTPATH=/Library/LaunchDaemons/
PLISTNAME=com.vagrantboot.test
SCRIPTPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/"
SCRIPTNAME=vagrantboot.sh
STDE=stde.txt
STDO=stdo.txt

# remove the daemon 
rm $PLISTPATH${PLISTNAME}.plist

# remove the main script file
rm $SCRIPTPATH$SCRIPTNAME

# remove the stdout and stderr file
rm $SCRIPTPATH$STDO
rm $SCRIPTPATH$STDE