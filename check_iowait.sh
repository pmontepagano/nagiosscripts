#!/bin/bash

if [ "$1" = "-w" ] && [ "$2" -gt "0" ] && [ "$3" = "-c" ] && [ "$4" -gt "0" ]; then
	IOWAIT=`iostat -y -c 10 1|sed -n "4p"|awk {'print $4'}|cut -d. -f1` 
#	echo " ##### DEBUG:	$IOWAIT " 
        if [ "$IOWAIT" -ge "$4" ]; then
                echo "IO Wait: CRITICAL - $IOWAIT % |IOWAIT=$IOWAIT;;;;"
                exit 2
        elif [ "$IOWAIT" -ge "$2" ]; then
                echo "IO Wait: WARNING - $IOWAIT % |IOWAIT=$IOWAIT;;;;"
                exit 1
        else
                echo "IO Wait: OK  - $IOWAIT % |IOWAIT=$IOWAIT;;;;"
                exit 0
        fi
else
        echo "$0 v1.0"
        echo ""
        echo "Usage:"
        echo "$0 -w <warnlevel> -c <critlevel>"
        echo ""
        echo "warnlevel and critlevel is percentage value without %"
	echo "
	echo "EXAMPLE:	/usr/lib64/nagios/plugins/check_iowait.sh -w 90 -c 95
        echo ""
        exit
fi

