#!/bin/bash

$(rm -rf queryresult.txt)
$(rm -rf mypath.cj)
files=$(find /proc -type $1 > queryresult.txt )
firstline=$(cat queryresult.txt| head -n 1)
echo var mypath:String=\"$(echo $firstline)\" >mypath.cj