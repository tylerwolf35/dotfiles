#!/bin/sh

temp1=70
temp2=85

temp=$(sensors | grep 'Tctl' | awk '{print $2}' | sed 's/+//' | sed 's/°C//')

if [ "$temp" -ge "$temp2" ] ; then
    echo "CPU: <fc=#C1514E>$temp</fc>°C"
elif [ "$temp" -ge "$temp1" ] ; then
    echo "CPU: <fc=#C1A24E>$temp</fc>°C"
else
    echo "CPU: <fc=#AAC0F0>$temp</fc>°C"

fi
