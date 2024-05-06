#!/bin/bash

#creating folders
mkdir /home/namespace 
mkdir /home/namespace/box
mkdir /home/namespace/box/data

#creting saminame folders
mkdir /home/namespace/box/bin
mkdir /home/namespace/box/lib
mkdir /home/namespace/box/lib64
mkdir /home/namespace/box/proc

#copy command files
cp -v /usr/bin/kill /home/namespace/box/bin/
cp -v /usr/bin/ps /home/namespace/box/bin/
cp -v /bin/bash /home/namespace/box/bin/
cp -v /bin/ls /home/namespace/box/bin/
cp -v /bin/ss /home/namespace/box/bin/

#copy lib dependency
cp -r /lib/* /home/namespace/box/lib/
cp -r /lib64/* /home/namespace/box/lib64/

# mounting proc directory
mount -t proc proc /home/namespace/box/proc

#bind dir tmp & data
mount --bind /tmp/ /home/namespace/box/data

#creating isolation space
unshare -p -f --mount-proc=/home/namespace/box/proc chroot /home/namespace/box /bin/bash
