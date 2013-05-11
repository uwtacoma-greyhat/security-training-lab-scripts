#!/bin/sh

# the location of the virtual machines to push
SOURCE_LOCATION=/home/$USER/vms/
DESTINATION_LOCATION=/home/$USER/vms/

MACHINE_PREFIX="cn"
STARTING_INDEX=2
ENDING_INDEX=12

trap 'echo " Quiting on signal. was deploying to machine $MACHINE_PREFIX$i"; exit' SIGINT SIGTERM

for i in `seq $STARTING_INDEX $ENDING_INDEX`; do
    rsync -avh $SOURCE_LOCATION $MACHINE_PREFIX$i:$DESTINATION_LOCATION -P --delete --delete-excluded --exclude 'VBox.log*' 
    for vm in $(VBoxManage list vms | awk -F{ '{print $NF }' | rev | cut -c 2- | rev); do
        ssh -f $MACHINE_PREFIX$i "VBoxManage modifyvm $vm --macaddress1 auto"
    done
done
