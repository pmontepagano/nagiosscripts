#!/bin/sh

warn=$1
crit=$2

i=$(vnstat -tr)

rx=$(echo $i | grep -o "rx [[:digit:]]*\.[[:digit:]]* kB/s")
tx=$(echo $i | grep -o "tx [[:digit:]]*\.[[:digit:]]* kB/s")

status="$rx $tx"

rx1=$(echo $rx | awk '{ print $2 }' | awk -F\. '{ print $1 }')
tx1=$(echo $tx | awk '{ print $2 }' | awk -F\. '{ print $1 }')

if (( $warn <= $rx1 )) || (( $warn <= $tx1 ))
then
  if (( $crit <= $rx1 )) || (( $crit <= $tx1 ))
  then
    echo "CRITICAL - $status"
    exit 2
  else
    echo "WARNING - $status"
    exit 1
  fi
else
  echo "OK - $status"
  exit 0
fi
