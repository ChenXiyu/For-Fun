#!/bin/bash

function help
{
	exit 0;
}
#参数解析
if [ $# -ne 1 ] ; then
	echo "Bad parameter!";
	help;
fi
IpAddr=($(echo $1 | sed 's/\// /;t;s/\\/ /'));
Ip=${IpAddr[0]};
NetMask=${IpAddr[1]};
((NetField=$NetMask/8));

Field1=$(echo $Ip | gawk '{FS=".";print $1;}');
Field2=$(echo $Ip | gawk '{FS=".";print $2;}');
Field3=$(echo $Ip | gawk '{FS=".";print $3;}');
Field4=$(echo $Ip | gawk '{FS=".";print $4;}');
