#!/bin/bash

## Modify next two VARS to your use case
LOCATION='ssh sid@my-print-server'
PRINTER='star-lc20'
FIRSTNUMBER="192"
## End modification

DATE=`date '+%Y-%m-%d %H:%M:%S'`
HOSTNAME=`hostname`
IP_COMMAND=$(ip 2>&1 | grep -c "not found")

if [[ $IP_COMMAND = 0 ]]
then 
    echo "ip gets ip address"
    IP=$(ip a | grep 'inet' | grep -E -o "$FIRSTNUMBER\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | head -1)
else
    echo "ifconfig gets ip address"
    IP=$(ifconfig | grep 'inet' | grep -E -o "$FIRSTNUMBER\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | head -1)
fi
printf "$DATE $HOSTNAME is reachable at $IP\r\n"|$LOCATION "lp -d $PRINTER"