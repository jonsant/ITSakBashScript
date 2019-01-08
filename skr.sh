#!/bin/bash

echo "Nummer 1?"
read num1

echo "Nummer 2?"
read num2

echo "$num1 * $num2 = $(($num1*$num2))"





echo "Siffra?"
read siffra

echo "Text?"
read text

antal=1

while [ $antal -lt $siffra ]; do
echo $text

antal=$((antal+1))
done




echo "Katalog?"
read katalog

for i in "$katalog"/*; do

echo $i

done




