#!/bin/bash

str=`who`

arr=($str)

fd="/dev/${arr[1]}"

echo $fd > path.txt

cat path.txt
