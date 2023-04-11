#!/bin/bash

LOG_DIR=/var/log/httpd
LOG_FILES=""
DATE=$(date +%Y-%m-%d)

if [ ! -d $LOG_DIR ]; then
       mkdir -p $LOG_DIR
fi

for file in $LOG_FILES; do
	if [ -f $LOG_DIR/$file ]; then
		mv $LOG_DIR/$file $LOG_DIR/$file.$DATE
	fi
	
	touch $LOG_DIR/$file

	chmod 644 $LOG_DIR/$file
done

systemctl restart httpd
