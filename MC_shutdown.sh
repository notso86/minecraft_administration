#!/bin/bash

# establish screen session of MC.$1
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

#wait for MCserver to settle
sleep 5

# cp /media/ramdisk0/MC.$1 to ~/MC/RDpers/
cp -r /media/ramdisk0/MC.$1 ~/MC/RDpers

#tar /media/ramdisk0 to ~/MC/backup/MCF_.sDown.tar.gz
d=$(date +"%d_%H_%M")
tar -czf /srv/MCbackups/$1_$d.sdn.tar.gz /media/ramdisk0/MC.$1
