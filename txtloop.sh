#!/bin/bash

echo "Katalog?"
read katalog

for i in "$katalog"/*.txt; do

	if [  -s $i ]
		then
		cat "$i"
	fi

done
