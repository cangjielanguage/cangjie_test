#!/bin/bash

a=`date`
location=${a: 0-8:3}
b=`date -R`
str=${b: 0-5:5}
sym=${str: 0-5:1}
hour=${str: 0-4:2}
minute=${str: 0-2:2}
second=`expr $hour \* 3600 + $minute / 60 \* 3600`

if [ "$sym" = "-" ];
then
	offset="-$second"
else
	offset=$second
fi

echo $location $offset
