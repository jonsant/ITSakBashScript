#!/bin/bash

lista=('google.se' 'facebook.com' 'aftonbladet.se' 'devhints.io' 'duckduckgo.com' 'microsoft.com' 'pcloud.com' 'xtrafik.se')


for i in "${lista[@]}"; do


	ip=$(host $i | grep "has address" | cut -d ' ' -f 4)
	ping=$(ping -c1 $i)

	if [[ $? == '0' ]]; then
		echo "Host $i med ip $ip är uppe"
	else
		echo "Host $i med ip $ip är nere"
	fi


done
