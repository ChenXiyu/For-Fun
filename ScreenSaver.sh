#!/usr/bin/bash

if [ $UID -eq 1000 ] 
then
	sudo /home/cxy/bin/brightnessCtl.sh -s 1  >> /dev/null;
	/usr/bin/cmatrix -u 2 ;
	sudo /home/cxy/bin/brightnessCtl.sh -s 100 >> /dev/null;
fi

exit 0;
