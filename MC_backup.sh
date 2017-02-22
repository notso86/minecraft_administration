#!/bin/bash

#BACKS UP MC.$1

d=$(date +"%dth_%H_%M")
#BUdir0=/media/80G
BUdir0=/srv/MCbackups/
#BUdir1=~/MC/backup
BUdir1=/srv/MCbackups/
RDdir=/media/ramdisk0

# establish screen session
reattach=$( screen -list | grep MC.$1 | awk '{print $1}' )

# put out save and tar /media/ramdisk0/MC.$1 to ~/MC/backup/$1.$d.tar.gz
screen -S $reattach -X stuff "save-all $(echo -ne '\r')"

# if top of hour put in diff dir and hold longer, else other dir and 24hr hold
m=$( date +%M )
if [ $m = "00" ]; then
   tar -czf $BUdir1/$1.$d.tar.gz $RDdir/MC.$1
else
   tar -czf $BUdir0/$1.$d.tar.gz $RDdir/MC.$1
fi
