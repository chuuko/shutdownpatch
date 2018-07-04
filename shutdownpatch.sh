#!/usr/bin/env bash
#Shutdown patch by squeakymouse
#Fixes annoying default behavior that prevent WMs from shutting down the system
#License: GPLv3

if(grep -Fxq "%users ALL=(ALL)   NOPASSWD: /sbin/shutdown" /etc/sudoers)
then
    echo "Default behavior already disabled; exiting"
    exit
else
    echo "Enabling shutdown for WMs... "
    cp /etc/sudoers /etc/sudoers.tmp
    echo "%users ALL=(ALL)   NOPASSWD: /sbin/shutdown" >> /etc/sudoers.tmp
    rename /etc/sudoers.tmp /etc/sudoers /etc/sudoers.tmp
    echo "Done!"
fi
