#!/bin/bash


#set up variables
LOGNAME=$(logname)
PLISTPATH=/Library/LaunchDaemons/
PLISTNAME=com.vagrantboot.test
SCRIPTPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/"
SCRIPTNAME=vagrantboot.sh
STDE=stde.txt
STDO=stdo.txt
VMNAME=community
PLISTCONTENT="
<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">
<plist version=\"1.0\">
	<dict>
		<key>Label</key>
		<string>${PLISTNAME}.plist</string>
		<key>ProgramArguments</key>
		<array>
			<string>${SCRIPTPATH}${SCRIPTNAME}</string>
		</array>
		<key>WorkingDirectory</key>
    	<string>/Users/${LOGNAME}</string>
		<key>StandardOutPath</key>
	    <string>$SCRIPTPATH${STDO}</string>
	    <key>StandardErrorPath</key>
	    <string>$SCRIPTPATH${STDE}</string>
		<key>RunAtLoad</key>
		<true/>
	</dict>
</plist>"

SCRIPTCONTENT="
export PATH=$PATH:/usr/local/bin\n
sudo -u ${LOGNAME} vboxmanage startvm $VMNAME --type headless
"

# create stdout for the script
touch $SCRIPTPATH$STDO
> $SCRIPTPATH$STDO

# create stderr for the script
touch $SCRIPTPATH$STDE
> $SCRIPTPATH$STDE

# create the plist in the /Library/LaunchDaemons/ folder
touch $PLISTPATH${PLISTNAME}.plist
> $PLISTPATH${PLISTNAME}.plist
echo $PLISTCONTENT >> $PLISTPATH${PLISTNAME}.plist 

# create the main script file
touch $SCRIPTPATH$SCRIPTNAME
> $SCRIPTPATH$SCRIPTNAME
echo $SCRIPTCONTENT >> $SCRIPTPATH$SCRIPTNAME

chmod 777 $SCRIPTPATH$SCRIPTNAME

