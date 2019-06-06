#!/bin/bash
sleep 5 
path="$HOME/screenshot/"
scr="screenshot"
thu="thumb"
dd=`date +%F_%R`

import -window root -quality 100 -silent $path$scr$dd.png
convert $path$scr$dd.png -resize 320x200 $path$thu$dd.png