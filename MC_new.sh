#!/bin/bash

# current script dir
#scripts=~/t_scripts
scripts=~/scripts

# path to seed files for new servers and path to RDpers
SEED=~/MC/MC.seed0
RDp=~/MC/RDpers

# path to ramdisk
RD=/media/ramdisk0

# establish and document port of new server
oldP=$(tail -1 ~/MC/serverports | awk '{print $1}')
newP=$(expr $oldP + 1)
echo "$newP MC.$1" >> ~/MC/serverports
sed -i "/server-port/c\server-port=$newP" $SEED/server.properties

# make new folder on /media/ramdisk
mkdir $RD/MC.$1 $RDp/MC.$1
# copy seed files to ramdisk and RDpers
cp -r $SEED/* $RD/MC.$1
cp -r $SEED/* $RDp/MC.$1

# start new server
$scripts/MC_start.sh $1

# show new server-port
echo "MC.$1 port is: $newP"
