#!/bin/bash

## Modify next two VARS to your use case
LOCATION='ssh sid@my-print-server'
PRINTER='star-lc20'
## End modification

DATE=`date '+%Y-%m-%d %H:%M:%S'`
HOSTNAME=`hostname`
FIRSTNUMBER="192"
IP=$(ifconfig | grep 'inet' | grep -E -o "$FIRSTNUMBER\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | head -1)

echo "$DATE $HOSTNAME is reachable at $IP" > print-ip.txt

cat print-ip.txt|$LOCATION "lp -d $PRINTER"