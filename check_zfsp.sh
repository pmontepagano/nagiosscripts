#!/bin/sh

#
# By Erdal Karli
# LTP: 24-10-2012
#
# Nagios solaris 10 zpools Checker
#
# ========================================================================================
#
# HISTORY :
#     Release   |     Date      |    Authors    |       Description
# --------------+---------------+---------------+------------------------------------------
#               |               |               | 
# --------------+---------------+---------------+------------------------------------------
#       1.0     |   24.10.2012  | Erdal Karli   | 
# =========================================================================================
#
# Nagios return codes
exit_code=0
STATE_OK=0
STATE_WARNING=1
STATE_CRITICAL=2
STATE_UNKNOWN=3
ZPOOLBIN="/sbin/zpool"

# Plugin parameters value if not define
WARNING_T="80"
CRITICAL_T="90"

# Plugin variable description
PROGNAME=check_zfsp.sh
RELEASE="Revision 1.0"
AUTHOR="by Erdal Karli <q@q.de> "

print_usage() {
        echo ""
        echo "$PROGNAME $RELEASE - zfs-Pools check script for Nagios"
        echo ""
        echo "Usage: check_zfsp.sh [zpool] [option]"
        echo ""
        echo "Flags:"
        echo "  -p           : zfs-Pool Name"
        echo ""
        echo "Option:"
        echo "  -w  <number> : Warning level in %"
        echo "  -c  <number> : Critical level in %"
        echo "  -h  Show this page"
        echo "  -v  Show Program Version"
        echo ""
    echo "Usage: $PROGNAME"
    echo "Usage: $PROGNAME --help"
    echo ""
}

print_help() {
        print_usage
        echo ""
        echo "This plugin will check zfs-Pools"
        echo ""
        exit 0
}

# Functions plugin usage
print_release() {
    echo "$RELEASE $AUTHOR"
}

if [ $# -lt 1 ]; then
    echo "no arguments"
    print_usage
    exit $STATE_UNKNOWN
fi

# Parse parameters
while test -n "$1"; do
    case "$1" in
        -h | --help)
            print_help
            exit $STATE_OK
            ;;
        -v | --version)
                print_release
                exit $STATE_OK
                ;;
        -p | --zpool)
               shift
                ZPOOL=$1
                ;;
        -w | --warning)
                shift
                WARNING_T=$1
                ;;
        -c | --critical)
                shift
                CRITICAL_T=$1
                ;;
        * )  
                echo "Unknown argument: $1";
                print_usage;
                exit $STATE_UNKNOWN;
                ;;
     esac
shift
done

errors_checker(){
	if [ $3 = "ONLINE" ];
	then
		if [ $2 -gt ${WARNING_T} -a $2 -lt ${CRITICAL_T} ];
		then
			exit_code=$STATE_WARNING
			exit_text="WARNING: $1 $2% in use ZFS is $3"
		elif [ $2 -gt ${CRITICAL_T} ]; then
			exit_code=$STATE_CRITICAL
			exit_text="CRITICAL: $1 $2% in use ZFS is $3"
		else
       	        	exit_text="OK: $1 $2% in use ZFS is $3"
		fi
	else
		exit_code=$STATE_CRITICAL
                exit_text="WARNING: $1 ZFS is not ONLINE"
	fi
}


CAPACITY=`$ZPOOLBIN list -Ho capacity ${POOL}|cut -d"%" -f1`
HEALTH=`$ZPOOLBIN list -Ho health ${POOL}`
errors_checker ${ZPOOL} ${CAPACITY} ${HEALTH}

echo ${exit_text}
exit ${exit_code}
