#!/bin/sh

MACHINE_PREFIX="cn"
STARTING_INDEX=2
ENDING_INDEX=12

COMMAND=$1

trap 'echo " Quiting on signal. was working on machine $MACHINE_PREFIX$i"; exit' SIGINT SIGTERM

for i in `seq $STARTING_INDEX $ENDING_INDEX`; do
    ssh -f $MACHINE_PREFIX$i "DISPLAY=:1 $COMMAND"
done
