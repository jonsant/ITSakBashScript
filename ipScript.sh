#!/bin/bash

lokal=$(ip address | grep inet | grep enp0s3 | cut -d " " -f 6 | cut -d "/" -f 1)
publik=`curl -s https://api.ipify.org?format=json | cut -d "\"" -f 4`



if [[ ! $lokal == $publik ]]; then
	echo "Din lokala IP: $lokal" 
	echo "Din publika IP är: $publik"
else
	echo "Din lokala och publika ip är: $lokal"
fi
