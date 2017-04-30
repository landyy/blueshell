#!/bin/bash

getdeps(){
    if [ ! -d "/etc/python3" ]; then

	if [ -d "/etc/apt/" ]; then
	    apt-get update; apt-get install python3 python-pip

	elif [ -d "/etc/pacman.d" ]; then
	    pacman -Sy python3 python-pip

	elif [ -d "/etc/yum" ]; then
	    yum update; yum install python3 python-pip

	else
	    echo "CRIT: No packagemanager recognized..WE ARE BAILING..
	    You are on your own!"
	    exit 1
	fi
    fi

    if [ ! -d "/usr/local/lib/python3.5/dist-packages/paramiko/" ]; then
	pip3 install paramiko
    else
	    echo "Somethings wrong with python-pip!"
    fi
}

clear

if [[ $EUID -ne 0 ]]; then
	echo "Run dis as ROOT yo!" 1>&2
	exit 1
else
	echo "Installing dependencies..."
	getdeps
fi

echo "Done!"
