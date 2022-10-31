#!/bin/sh

temp1=70
temp2=85

temp=$(nvidia-smi | grep 'Default' | awk '{print $3}' | sed 's/C//')

if [ "$temp" -ge "$temp2" ] ; then
    echo "GPU: <fc=#C1514E>$temp</fc>°C"
elif [ "$temp" -ge "$temp1" ] ; then
    echo "GPU: <fc=#C1A24E>$temp</fc>°C"
else
    echo "GPU: <fc=#AAC0F0>$temp</fc>°C"

fi
