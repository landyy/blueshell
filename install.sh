#!/bin/bash

getdeps(){
    if [  ]

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

    if [ "" ]
