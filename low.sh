#!/bin/bash

echo "Siffra 1?"
read num1

echo "Siffra 2?"
read num2

if [ $num1 -lt $num2 ]
	then
	echo $num1
elif [ $num1 -eq $num2 ]
	then
	echo "Lika"
else 
	echo $num2
fi
