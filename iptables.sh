#!/bin/bash

#ports for said server
output=(change me)
input=(change me)

#ports for 


prereqs(){
	
	#reset
	iptables -t mangle -F
	iptables -F

	#Flushes chain
	iptables -t mangle -X
	iptables -X

	#set chains
	iptables -t mangle -P OUTPUT ACCEPT
	ipables -t mangle -P INPUT ACCEPT
	iptables -t mangle -P FORWARD DROP

}

output(){

	for i in ${output[@]}; do
		iptables -t mangle -A OUTPUT -p tcp --sport $j -j ACCEPT


