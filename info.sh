#!/bin/bash

lokalIP=$(ip address | grep inet | grep enp0s3 | cut -d " " -f 6 | cut -d "/" -f 1)
dist=$(cat /etc/*-release | grep -w "NAME" | cut -d '"' -f 2)
distVer=$(cat /etc/*-release | grep -w VERSION | cut -d '"' -f 2)
kernelVer=$(uname -a | cut -d ' ' -f 3)
lastBoot=$(uptime | cut -d ' ' -f 4 | sed 's/\,//')
loggedInUsers=$(users)
	
echo "Hostname: `hostname`"
echo "IP: $lokalIP"
echo "Distribution: $dist"
echo "Distribution version: $distVer"
echo "Kernelversion: $kernelVer"
echo "Time since last boot: $lastBoot"
echo "Logged in users: $loggedInUsers"
