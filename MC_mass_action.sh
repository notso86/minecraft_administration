#!/bin/bash
#echo "What action? (backup | check | new | restart | shutdown | start)"
#read action

action=$1
END=$#

for server in $(seq 2 $END); do
   ~/scripts/MC_$action.sh "${!server}" &
done
