    #!/bin/bash
    ## google-script simple par photonucleon
    ## source : http://crunchbang.org/forums/viewtopic.php?id=29412
    gsearch="`zenity --entry --title='Google' --text='Recherche:'`"
    if [ -z $gsearch ]
    	then
    		exit
    else
    	x-www-browser "http://www.google.fr/search?q=$gsearch"
    fi
    exit

