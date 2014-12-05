#!/bin/bash
function help
{
cat<<_EFO_
	clock -- show a big clock on your terminal;
		-h show this page;
		-s "ScreenSaver" mode,exits on first keystroke,default prese q to quit;
		-C <COLOR> use this color for clock;

	made by XiyuChen
	email:NwsuafChenXiyu@gmail.com
_EFO_
exit 0;
}

set -- $(getopt hsC: "$@");

ScreenSaver=0;

while test -n "$1" ;
do
	case $1 in 
		-h) help;;
		-s) ScreenSaver=1;shift;;
		-C) Color=$2;shift 2;;
		--) shift;;
		*) echo "Bad Paramerter" >&2;help;;
	esac
done

echo -e "\e[?25l";

function Add_space
{
	local i ;
	for (( i = 0 ; i < $1 ; i++ ))
	do
		echo -n " ";
	done
}

function Add_Star
{
	local i ;
	for (( i = 0 ; i < $1 ; i++)) ; do
		echo -ne "\033[1;47m \033[0m";
	done
}

function AREA1
{
	local i;
	for (( i = 1 ; i <= $Transverse_Length ; i++ )) 
	do
		Add_space $Width_Interval_B_and_E ;
		if [ $NUM1 -ne 1 ] && [ $NUM1 -ne 4 ] ;then
			Add_Star $Transverse_Width ;
		else
			Add_space $Transverse_Width ;
		fi
		Add_space $Slice_screen_COL;
		if [ $NUM2 -ne 1 ] && [ $NUM2 -ne 4 ] ;then
			Add_Star $Transverse_Width ;
		else
			Add_space $Transverse_Width ;
		fi
		Add_space $Slice_screen_COL;
		Add_space $Transverse_Width;
		Add_space $Slice_screen_COL;
		if [ $NUM3 -ne 1 ] && [ $NUM3 -ne 4 ] ; then
			Add_Star $Transverse_Width;
		else
			Add_space $Transverse_Width ;
		fi
		Add_space $Slice_screen_COL;
		if [ $NUM4 -ne 1 ] && [ $NUM4 -ne 4 ] ; then
			Add_Star $Transverse_Width;
		else
			Add_space $Transverse_Width;
		fi
				echo ;
	done
}

function AREA2
{
	local i ;
	for (( i=0 ; i < $Vertical_Length ; i++))
	do
		Add_space $Width_Interval_B_and_E;
		
		if [ $NUM1 -eq 2 ]||[ $NUM1 -eq 3 ]||[ $NUM1 -eq 7 ];then
			Add_space $Vertical_Width;
			Add_space $[$Slice_screen_COL * 3];
			Add_Star $Vertical_Width;
		elif [ $NUM1 -eq 1 -o $NUM1 -eq 5 -o $NUM1 -eq 6 ];then
			Add_Star $Vertical_Width;
			Add_space $[$Slice_screen_COL * 3];
			Add_space $Vertical_Width;
		else
			Add_Star $Vertical_Width;
			Add_space $[$Slice_screen_COL * 3];
			Add_Star $Vertical_Width;
		fi

		Add_space $Slice_screen_COL;

		if [ $NUM2 -eq 2 ]||[ $NUM2 -eq 3 ]||[ $NUM2 -eq 7 ];then
			Add_space $Vertical_Width;
			Add_space $[$Slice_screen_COL * 3];
			Add_Star $Vertical_Width;
		elif [ $NUM2 -eq 1 -o $NUM2 -eq 5 -o $NUM2 -eq 6 ];then
			Add_Star $Vertical_Width;
			Add_space $[$Slice_screen_COL * 3];
			Add_space $Vertical_Width;
		else
			Add_Star $Vertical_Width;
			Add_space $[$Slice_screen_COL * 3];
			Add_Star $Vertical_Width;
		fi

		Add_space $Slice_screen_COL;

		Add_space $Vertical_Width;
		if [ $i -ge $[$Vertical_Length/3] -a $i -le  $[$Vertical_Length/3*2] ] ;then
			Add_Star $[$Slice_screen_COL  * 2];
			Add_space $Slice_screen_COL;
		else
			Add_space $[$Slice_screen_COL * 3];
		fi
		Add_space $Vertical_Width;

		Add_space $Slice_screen_COL;

		if [ $NUM3 -eq 2 ]||[ $NUM3 -eq 3 ]||[ $NUM3 -eq 7 ];then
			Add_space $Vertical_Width;
			Add_space $[$Slice_screen_COL * 3];
			Add_Star $Vertical_Width;
		elif [ $NUM3 -eq 1 -o $NUM3 -eq 5 -o $NUM3 -eq 6 ];then
			Add_Star $Vertical_Width;
			Add_space $[$Slice_screen_COL * 3];
			Add_space $Vertical_Width;
		else
			Add_Star $Vertical_Width;
			Add_space $[$Slice_screen_COL * 3];
			Add_Star $Vertical_Width;
		fi

		Add_space $Slice_screen_COL;

		if [ $NUM4 -eq 2 ]||[ $NUM4 -eq 3 ]||[ $NUM4 -eq 7 ];then
			Add_space $Vertical_Width;
			Add_space $[$Slice_screen_COL * 3];
			Add_Star $Vertical_Width;
		elif [ $NUM4 -eq 1 -o $NUM4 -eq 5 -o $NUM4 -eq 6 ];then
			Add_Star $Vertical_Width;
			Add_space $[$Slice_screen_COL * 3];
			Add_space $Vertical_Width;
		else
			Add_Star $Vertical_Width;
			Add_space $[$Slice_screen_COL * 3];
			Add_Star $Vertical_Width;
		fi

		echo ;
	done
}

function AREA3
{
	local i;
	for (( i = 1 ; i <= $Transverse_Length ; i++ )) 
	do
		Add_space $Width_Interval_B_and_E ;

		if [ $NUM1 -ne 1 ] && [ $NUM1 -ne 7 ]&&[ $NUM1 -ne 0 ] ;then
			Add_Star $Transverse_Width ;
		else
			Add_space $Transverse_Width ;
		fi

		Add_space $Slice_screen_COL;

		if [ $NUM2 -ne 1 ] && [ $NUM2 -ne 7 ]&&[ $NUM2 -ne 0 ] ;then
			Add_Star $Transverse_Width ;
		else
			Add_space $Transverse_Width ;
		fi

		Add_space $Slice_screen_COL;

		Add_space $Transverse_Width;

		Add_space $Slice_screen_COL;

		if [ $NUM3 -ne 1 ] && [ $NUM3 -ne 7 ]&&[ $NUM3 -ne 0 ] ; then
			Add_Star $Transverse_Width;
		else
			Add_space $Transverse_Width ;
		fi

		Add_space $Slice_screen_COL;

		if [ $NUM4 -ne 1 ] && [ $NUM4 -ne 7 ] && [ $NUM4 -ne 0 ]; then
			Add_Star $Transverse_Width;
		else
			Add_space $Transverse_Width;
		fi
		echo ;
	done

}

function AREA4
{
	local i ;
	for (( i=0 ; i < $Vertical_Length ; i++))
	do
		Add_space $Width_Interval_B_and_E;
		
		if [ $NUM1 -eq 3 ]||[ $NUM1 -eq 4 ]||[ $NUM1 -eq 5 ]||[ $NUM1 -eq 7 ]||[ $NUM1 -eq 9 ];then
			Add_space $Vertical_Width;
			Add_space $[$Slice_screen_COL * 3];
			Add_Star $Vertical_Width;
		elif [ $NUM1 -eq 1 -o $NUM1 -eq 2 ];then
			Add_Star $Vertical_Width;
			Add_space $[$Slice_screen_COL * 3];
			Add_space $Vertical_Width;
		else
			Add_Star $Vertical_Width;
			Add_space $[$Slice_screen_COL * 3];
			Add_Star $Vertical_Width;
		fi

		Add_space $Slice_screen_COL;

		if [ $NUM2 -eq 3 ]||[ $NUM2 -eq 4 ]||[ $NUM2 -eq 5 ]||[ $NUM2 -eq 7 ]||[ $NUM2 -eq 9 ];then
			Add_space $Vertical_Width;
			Add_space $[$Slice_screen_COL * 3];
			Add_Star $Vertical_Width;
		elif [ $NUM2 -eq 1 -o $NUM2 -eq 2 ];then
			Add_Star $Vertical_Width;
			Add_space $[$Slice_screen_COL * 3];
			Add_space $Vertical_Width;
		else
			Add_Star $Vertical_Width;
			Add_space $[$Slice_screen_COL * 3];
			Add_Star $Vertical_Width;
		fi

		Add_space $Slice_screen_COL;

		Add_space $Vertical_Width;
		if [ $i -ge $[$Vertical_Length/3] -a $i -le  $[$Vertical_Length/3*2] ];then
			Add_Star $[$Slice_screen_COL * 2];
			Add_space $Slice_screen_COL;
		else
			Add_space $[$Slice_screen_COL * 3];
		fi
		Add_space $Vertical_Width;

		Add_space $Slice_screen_COL;

		if [ $NUM3 -eq 3 ]||[ $NUM3 -eq 4 ]||[ $NUM3 -eq 5 ]||[ $NUM3 -eq 7 ]||[ $NUM3 -eq 9 ];then
			Add_space $Vertical_Width;
			Add_space $[$Slice_screen_COL * 3];
			Add_Star $Vertical_Width;
		elif [ $NUM3 -eq 1 -o $NUM3 -eq 2 ];then
			Add_Star $Vertical_Width;
			Add_space $[$Slice_screen_COL * 3];
			Add_space $Vertical_Width;
		else
			Add_Star $Vertical_Width;
			Add_space $[$Slice_screen_COL * 3];
			Add_Star $Vertical_Width;
		fi

		Add_space $Slice_screen_COL;

		if [ $NUM4 -eq 3 ]||[ $NUM4 -eq 4 ]||[ $NUM4 -eq 5 ]||[ $NUM4 -eq 7 ]||[ $NUM4 -eq 9 ];then
			Add_space $Vertical_Width;
			Add_space $[$Slice_screen_COL * 3];
			Add_Star $Vertical_Width;
		elif [ $NUM4 -eq 1 -o $NUM4 -eq 2 ];then
			Add_Star $Vertical_Width;
			Add_space $[$Slice_screen_COL * 3];
			Add_space $Vertical_Width;
		else
			Add_Star $Vertical_Width;
			Add_space $[$Slice_screen_COL * 3];
			Add_Star $Vertical_Width;
		fi

		echo ;
	done
}

function AREA5
{
	local i;
	for (( i = 1 ; i <= $Transverse_Length ; i++ )) 
	do
		Add_space $Width_Interval_B_and_E ;

		if [ $NUM1 -ne 1 ] && [ $NUM1 -ne 7 ]&&[ $NUM1 -ne 4 ] ;then
			Add_Star $Transverse_Width ;
		else
			Add_space $Transverse_Width ;
		fi

		Add_space $Slice_screen_COL;

		if [ $NUM2 -ne 1 ] && [ $NUM2 -ne 7 ]&&[ $NUM2 -ne 4 ] ;then
			Add_Star $Transverse_Width ;
		else
			Add_space $Transverse_Width ;
		fi

		Add_space $Slice_screen_COL;

		Add_space $Transverse_Width;

		Add_space $Slice_screen_COL;

		if [ $NUM3 -ne 1 ] && [ $NUM3 -ne 7 ]&&[ $NUM3 -ne 4 ] ; then
			Add_Star $Transverse_Width;
		else
			Add_space $Transverse_Width ;
		fi

		Add_space $Slice_screen_COL;

		if [ $NUM4 -ne 1 ] && [ $NUM4 -ne 7 ] && [ $NUM4 -ne 4 ]; then
			Add_Star $Transverse_Width;
		else
			Add_space $Transverse_Width;
		fi
	#	if [ $i -ne $Transverse_Length ] ; then
			echo ;
	#	fi
	done
}

function Draw
{
	for (( i = 0 ; i < $Length_Interval_B_and_E;i++));do
		echo ;
	done
	AREA1;
	AREA2;
	AREA3;
	AREA4;
	AREA5;
	for (( i = 0 ; i < $Length_Interval_B_and_E;i++));do
		echo ;
	done

}
trap "clear;echo -ne '\e[0m';echo -e '\e[?25h'" EXIT;

COLUMNS=0;
LINES=0; 
NUM1=8;
NUM2=8;
NUM3=8;
NUM4=8;

while [	1 ];do 
	if [ $COLUMNS -ne $(tput cols) ] || [ $LINES -ne $(tput lines) ];then
		COLUMNS=$(tput cols);
		#LINES=$[$(tput lines)-1];
		LINES=$[$(tput lines)];
		Slice_screen_COL=$(echo $COLUMNS/29 | bc );
		Width_Interval_B_and_E=$(( ($COLUMNS - $Slice_screen_COL * 29) / 2 )) ;
		Slice_screen_LINE=$(( $LINES / 20 )) ;
		Length_Interval_B_and_E=$[ ($LINES - $Slice_screen_LINE*20) / 2 ] ;
		Vertical_Width=$(( $Slice_screen_COL * 1 )) ;
		Vertical_Length=$(( $Slice_screen_LINE * 7 ));
		Transverse_Width=$(( $Slice_screen_COL * 5 ));
		Transverse_Length=$(( $Slice_screen_LINE * 2 ));
		SecondLocateY=$LINES;
		SecondLocateX=$[${COLUMNS}-2];
	
		Draw;
	fi

	if [ $NUM1 -ne $(date +%H | cut -b 1) ]||[ $NUM2 -ne $(date +%H | cut -b 2) ]||[ $NUM3 -ne $(date +%M | cut -b 1) ]||[ $NUM4 -ne $(date +%M | cut -b 2) ];then
		NUM1=$(date +%H | cut -b 1);
		NUM2=$(date +%H | cut -b 2);
		NUM3=$(date +%M | cut -b 1);
		NUM4=$(date +%M | cut -b 2);
	
		Draw;
	fi

	second=$(date +%S);

	echo -ne "\033[${SecondLocateY};${SecondLocateX}H\e[30;1m$second\e[0m";

	read -t 1 -n1 stat;	
	if [ $ScreenSaver -eq 1 ];then 
		test -n "$stat"&& exit 0;
	else 
		test "$stat" = "q" && exit 0;
	fi

	if [ "$second" = "59" ] ; then
		echo -ne "\033[${SecondLocateY};${SecondLocateX}H  \e[0m";
	fi
done 
