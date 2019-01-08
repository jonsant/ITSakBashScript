#!/bin/bash

randNum=$(( ( RANDOM % 100 ) +1 ))

echo "Jag har ett nummer."

numTries=0

while [ $numTries -lt 10 ]
do

read num

	if [ $num -lt $randNum ]
	then
		echo "Högre"

	elif [ $num -gt $randNum ]
	then
		echo "Lägre"

	else
		echo "Rätt!"
		exit
	fi


numTries=$(($numTries+1))
done

