#!/bin/bash

getdeps(){
    if [ ! -d "/etc/python3" ]; then
	
	if [ -d "/etc/apt/" ]; then
	    apt-get install python3
	
	elif [ -d "/etc/pacman" ]; then
	    pacman -S python3

	elif [ -d "/etc/yum" ]; then
	    yum install python3

	else
	    echo "We are in a terrible hell. No package managers available :("
	    exit 1
	fi
    fi

    if [ ! -f "/usr/bin/pip" ]; then
	
	if [ -d "/etc/apt/" ]; then
	    apt-get install python-pip
	
	elif [ -d "/etc/pacman" ]; then
	    pacman -S python-pip

	elif [ -d "/etc/yum" ]; then
	    yum install python-pip

	else
	    echo "We are in a terrible hell. No package managers available :("
	    exit 1
	fi

    fi

    if [ ! -d "/usr/local/lib/python3.5/dist-packages/paramiko/" ]; then

	pip3 install paramiko

    fi
}

clear
echo "Installing dependencies..."

getdeps

echo "Done!"