#!/bin/sh

# the location of the virtual machines to push
SOURCE_LOCATION=/home/$USER/vms/
DESTINATION_LOCATION=/home/$USER/vms/

MACHINE_PREFIX="cn"
STARTING_INDEX=2
ENDING_INDEX=12

trap 'echo " Quiting on signal. was deploying to machine $MACHINE_PREFIX$i"; exit' SIGINT SIGTERM

for i in `seq $STARTING_INDEX $ENDING_INDEX`; do
    rsync -rvh $SOURCE_LOCATION $MACHINE_PREFIX$i:$DESTINATION_LOCATION -P --delete
done
