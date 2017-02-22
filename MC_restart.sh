#!/bin/bash

RD=/media/ramdisk0
BU=/srv/MCbackups

# establish screen of MC.$1
reattach=$( screen -list | grep MC.$1 | awk '{print $1}' )

# put out warnings to MC.$1
screen -S $reattach -X stuff "say SERVER GOING DOWN IN 1 MINUTE $(echo -ne '\r')"
screen -S $reattach -X stuff "say BUT WILL RETURN SHORTLY $(echo -ne '\r')"
sleep 30
screen -S $reattach -X stuff "say SERVER GOING DOWN IN 30 SECONDS $(echo -ne '\r')"
screen -S $reattach -X stuff "say BUT WILL RETURN SHORTLY $(echo -ne '\r')"
sleep 15
screen -S $reattach -X stuff "say SERVER GOING DOWN IN 15 SECONDS $(echo -ne '\r')"
screen -S $reattach -X stuff "say BUT WILL RETURN SHORTLY $(echo -ne '\r')"
sleep 5
screen -S $reattach -X stuff "say SERVER GOING DOWN IN 10 SECONDS $(echo -ne '\r')"
screen -S $reattach -X stuff "say BUT WILL RETURN SHORTLY $(echo -ne '\r')"
sleep 5
screen -S $reattach -X stuff "say SERVER GOING DOWN IN 5 SECONDS $(echo -ne '\r')"
screen -S $reattach -X stuff "say BUT WILL RETURN SHORTLY $(echo -ne '\r')"
sleep 1
screen -S $reattach -X stuff "say 4 $(echo -ne '\r')"
sleep 1
screen -S $reattach -X stuff "say 3 $(echo -ne '\r')"
sleep 1
screen -S $reattach -X stuff "say 2 $(echo -ne '\r')"
sleep 1
screen -S $reattach -X stuff "say 1 $(echo -ne '\r')"
sleep 1

# stop MC.$1
screen -S $reattach -X stuff "stop $(echo -ne '\r')"

# wait for MCserver to settle
sleep 5

# cp $RD/MC.$1 files to /home/notso86/MC/RDpers/MC.$1
cp -r $RD/MC.$1 ~/MC/RDpers

#tar $RD/MC.$1 to $BU/MCF..$d.$1.tar.gz
d=$(date +"%dth_%H_%M")
tar -czf $BU/$1_$d.rbt.tar.gz $RD/MC.$1

# start MC.$1
~/scripts/MC_start.sh $1
