#!/bin/bash

EXCLUDE_LIST=~/Documents/06_private/XPS/i3-config/exclude-list.txt
SOURCE=~/Documents
DESTINATION_PATH=/vol/backup
DESTINATION_DIR=BACKUP-XPS

echo "Mounting USB key on $DESTINATION_PATH"
mount /vol/backup
if [ $? -ne 0 ]; then
	echo "Please insert the Backup key first."
	exit 1
fi

if [ ! -d $DESTINATION_PATH/$DESTINATION_DIR ]; then
	echo "Please mount your backup disk manually."
	echo "I should find \"DESTINATION_PATH/$DESTINATION_DIR \" directory."
	umount $DESTINATION_PATH
	exit 1
fi

echo "Syncing backup. Please wait."
rsync -av --exclude-from $EXCLUDE_LIST $SOURCE $DESTINATION_PATH/$DESTINATION_DIR

echo "Ejecting USB key."
sync; sync; sync
umount /vol/backup
echo "Done."



# /etc/fstab
# usbkey for backup - Nov 2018
# UUID="029d707c-f1e9-470a-9e66-5bfa95fc575b" /vol/backup ext4 rw,user,noauto 0 2

# ls -lR /vol
# drwxrwxr-x 2 jp jp 4,0K nov.   4 12:26 backup/


