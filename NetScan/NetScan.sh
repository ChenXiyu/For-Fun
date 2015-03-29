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

Field1=$(echo $Ip | gawk 'BEGIN{FS="."}{print $1;}');
Field2=$(echo $Ip | gawk 'BEGIN{FS="."}{print $2;}');
Field3=$(echo $Ip | gawk 'BEGIN{FS="."}{print $3;}');
Field4=$(echo $Ip | gawk 'BEGIN{FS="."}{print $4;}');

trap exit 2 SIGINT;

PrintOK()
{
	echo -e "\033[32m[OK]\033[0m";
}

PING()
{
	ping -c 1 -W 1 $1 &> /dev/null  ;

	if [ $? -eq 0 ] ; then 
		echo -n $1 ;
		PrintOK;
		return 0;
	fi

	return 1;
	
}


if [ $NetField -eq 3 ] ; then

	#for(( LastNum=$Field4 ; LastNum<255 ; LastNum++ )){

	# 	PING "$Field1.$Field2.$Field3.$LastNum"&

	#}
	for LastNum in `seq $Field4 254`;do
	 	PING "$Field1.$Field2.$Field3.$LastNum"&
	done
fi
wait;
