#!/bin/bash

rnum="$RANDOM % 1000"

x=0

while [$x =! ${rnum}]; do
read x
if [ -z $x ]
then
	echo 'Null value'
	a=0
else

	if ["$x" =~ ^[0-10]+$]
	then
		if [$a -gt ${rnum}]
		
		then		

			echo -n 'too high'
		else
		if [$x -lt ${rnum}]
			echo -n 'too low'
		fi
		fi
		if [ $x = ${rnum}]
		then
			echo 'Jackpot,kems,bingo!'
		fi
	else
		echo 'Nope try again'