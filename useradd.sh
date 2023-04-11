#!/bin/sh

#FILE READ
while read LINE
do

USER=`echo $LINE | sed -e 's/:.*$//'`

#USERADD
useradd $USER
echo $LINE | chpasswd

done < addlist.txt

exit
