#!/bin/bash

# script location
s=~/scripts/MC_script.sh

#starts detattched screen with MC.$1 MC_script.sh
screen -dmS MC.$1 $s $1 "$(echo -ne '\r')"
