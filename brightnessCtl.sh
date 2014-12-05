#!/bin/bash
# 

function help
{
	cat<<EOF
BrightCtl  --  change your terminal brightness (root)
usage :  BrightCtl [-s <NUM>] [-l] 
OPTION:
	-s <NUM> set the brightness you want as NUM%;
	-l		 (default)list the current brightness ;
	-h this page

Made by XiyuChen 
Email : NwsuafChenXiyu@gmail.com
EOF
	exit 0;
}

if [ $# -le 0 -o $# -gt 3 ];then
	help ;
	exit 1;
fi

set -- $(getopt s:lh "$@"); #get the parameters and format it

SBOOL=0;
LBOOL=0;

while [ -n "$1" ] ; do 
	case "$1" in
		-s) SBOOL=1;NUM=$2 ; shift 2 ;;
		-l) LBOOL=1;shift ;;
		-h) help; exit 0 ;;
		--) shift;;
		*) help;exit 1;;
	esac
done

MAX_FILE="/sys/class/backlight/intel_backlight/max_brightness";
ACTUAL_BRIGHTNESS="/sys/class/backlight/intel_backlight/actual_brightness";
BRIGHTNESS_FILE="/sys/class/backlight/intel_backlight/brightness"

if [ -f $MAX_FILE ] ; then 
	MAX_BRIGHTNESS=$(cat $MAX_FILE);
else
	echo "Error : The file $MAX_FILE is not exist!">&2 ;
	exit 1 ;
fi

if [ -f $ACTUAL_BRIGHTNESS ] ; then 
	ACTUAL=$(cat $ACTUAL_BRIGHTNESS)
else
	echo "Error : The file $ACTUAL_BRIGHTNESS is not exist!">&2;
fi

if [ $LBOOL -eq 1 ] ; then
	((BR=$ACTUAL*100/$MAX_BRIGHTNESS));
	echo "The current Brightness is $BR%" ;
fi

if [ $SBOOL -eq 1 ] ; then 
	if [ $NUM -ge 0 -a $NUM -le 100 ] ; then

		BRIGHTNESS=$(bc << EOL
$MAX_BRIGHTNESS*$NUM/100;
EOL
);
		echo $BRIGHTNESS > $BRIGHTNESS_FILE;
		echo "OK!";
	else
		echo "bad parameters";
		exit 1;
	fi
fi
exit 0;
