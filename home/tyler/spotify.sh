#!/bin/sh

running=$(pidof spotify)
if [ "$running" != "" ]; then
    artist=$(playerctl metadata artist)
    song=$(playerctl metadata title | cut -c 1-60)
    echo "<txt>$artist · $song</txt>"
    echo "<txtclick>xdotool exec playerctl play-pause</txtclick>"
fi
