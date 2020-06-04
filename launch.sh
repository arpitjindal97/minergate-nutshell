#!/bin/bash

POWER=${power:=2}
USER=${user:="kbxrhj19fyp5bcp"}
COIN=${coin:="xmr"}

if [ "$clever" -eq "1" ];
then
    tor &
    sleep 30

    while :
    do
        torsocks minergate-cli -u $USER --$COIN $POWER
        sleep 10
    done
else
    while :
    do
        minergate-cli -u $USER --$COIN $POWER
        sleep 10
    done
fi
