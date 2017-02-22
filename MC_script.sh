#!/bin/bash

#must be started in a SCREEN
#starts MC.$1

jarfile=prod.jar
RD=/media/ramdisk0
#                      change ^ line
javaoptions="-XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+UseParNewGC -XX:+CMSIncrementalPacing -XX:ParallelGCThreads=2 -XX:+AggressiveOpts -jar"
lowmem="-Xmx1G -Xms1G"
stanmem="-Xmx2G -Xms1G"
highmem="-Xmx4G -Xms1G"

cd $RD/MC.$1
if [ "$1" == public ] || [ "$1" == creative ]; then
   java -server $stanmem $javaoptions $jarfile nogui
elif [ "$1" == notso86 ] || [ "$1" == SOI-LB ]; then
   java -server $highmem $javaoptions $jarfile nogui
else
   java -server $stanmem $javaoptions $jarfile nogui
fi
