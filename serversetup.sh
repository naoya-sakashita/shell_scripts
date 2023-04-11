#!/bin/bash

#update
dnf update -y

#タイムゾーンをAsia/Tokyoに設定する。
timedatectl set-timezone Asia/Tokyo

#logrotate設定
FILE="/usr/cronscript/rotate.txt"
LASTDAY="date -d '1 days ago' '+%Y%m%d'"
if [ -e ${FILE} ] ; then
while read line
do
if [ -e ${line} ]; then
cp ${line} ${line}_${LASTDAY}
if [ $? -eq 0 ]; then
cp /dev/null ${line}
fi
find dirname ${line} -name "basename ${line}_*" -type f -ctime +30 | xargs rm -rf
fi
done < ${FILE}
fi
exit 0;
