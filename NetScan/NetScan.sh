#!/bin/bash

function help
{
	exit 0;
}

IpList=$(./ParseIpAddr $1);

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

	for Ip in $IpList ;do
	 	PING "$Ip"&
	done
wait;
