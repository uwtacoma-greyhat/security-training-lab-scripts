#!/bin/sh

# the location of the item to push
SOURCE_LOCATION=/home/$USER/$1
DESTINATION_LOCATION=/home/$USER/$1

MACHINE_PREFIX="cn"
STARTING_INDEX=2
ENDING_INDEX=12

trap 'echo " Quiting on signal. was deploying to machine $MACHINE_PREFIX$i"; exit' SIGINT SIGTERM

for i in `seq $STARTING_INDEX $ENDING_INDEX`; do
    rsync -rvh $SOURCE_LOCATION $MACHINE_PREFIX$i:$DESTINATION_LOCATION -P --delete
done
