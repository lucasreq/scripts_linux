#!/bin/sh
#
WAIT=`zenity --entry --title="Timer" \
     --text="Temps de l'activité? (ex: 10m)"`
 
if [ -n "$(echo $WAIT | grep -o 'm')" ]; then
    # minutes
    FACT=60
    WAIT=$(echo $WAIT | sed 's;m;;')
elif [ -n "$(echo $WAIT | grep -o 'h')" ]; then
    # heures
    WAIT=$(echo $WAIT | sed 's;h;;')
    FACT=3600
else
    # secondes
    WAIT=$(echo $WAIT | sed 's;s;;')
    FACT=1
fi
 
WAIT=$(echo $(expr $WAIT \* $FACT))
echo $WAIT
i=0
 
(
    echo "#$WAIT secondes restantes"
    while [ "$i" -lt "$WAIT" ]; do
        sleep 1
        i=$(expr $i + 1)
        PERC=$(expr $i \* 100 / $WAIT )
        echo "$PERC"
        echo "#$(expr $WAIT - $i) secondes restantes"
    done
) | 
zenity --progress \
    --percentage=0 \
    --title="Compte à rebours" \
    --auto-kill 
 
 
aplay ~/.scripts/harp.wav
zenity --info --title="Timer" --text="C'est fini!"
 
exit 0