#!/bin/bash

echo -n "Vilken mapp ska säkerhetskopieras? "
read mapp

if [[ ! -e "$mapp.tar.gz"  ]]; then

	tar -czvf $mapp.tar.gz $mapp/
else
	gunzip $mapp.tar.gz
	tar -uvf $mapp.tar $mapp/
	gzip $mapp.tar
fi
