#!/bin/bash

if [ ! $UID -eq 1 ] 
then
	# not root
	sudo /home/cxy/bin/brightnessCtl.sh -s 5  >> /dev/null;
	/usr/bin/cmatrix -u 2 ;
	sudo /home/cxy/bin/brightnessCtl.sh -s 100 >> /dev/null;
else
	# root 
	/home/cxy/bin/brightnessCtl.sh -s 5  >> /dev/null;
	/usr/bin/cmatrix -u 2 ;
	/home/cxy/bin/brightnessCtl.sh -s 100 >> /dev/null;
fi

exit 0;
