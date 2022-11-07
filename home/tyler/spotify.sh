#!/bin/sh

running=$(pidof spotify)
if [ "$running" != "" ]; then
    artist=$(playerctl metadata artist)
    title=$(playerctl metadata title | cut -c 1-60)
    album=$(playerctl metadata album)
    echo "<txt>$artist · $title</txt>"
    echo "<txtclick>xdotool exec playerctl play-pause</txtclick>"
    echo "<tool>Title      $title"
    echo "Artist     $artist"
    echo "Album   $album</tool>"
else
    echo ""
fi
