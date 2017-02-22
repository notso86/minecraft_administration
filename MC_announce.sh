#!/bin/bash

#MAKES ANNOUNCEMENTS TO MC.$1

# establish screen session MC.$1
reattach=$( screen -list | grep MC.$1 | awk '{print $1}' )

#put out warnings to MC.$1
screen -S $reattach -X stuff "say Announcement: $(echo -ne '\r')"
screen -S $reattach -X stuff "say Hardware upgrade scheduled for $(echo -ne '\r')"
screen -S $reattach -X stuff "say Friday morning-ish April 15th. $(echo -ne '\r')"
screen -S $reattach -X stuff "say Warnings will be given before shutdown. $(echo -ne '\r')"
