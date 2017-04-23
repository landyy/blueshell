#!/usr/bin/env python3

from paramiko import client
from socket import error as socket_error
import errno
import random
import string

#
#Deploy script but actually fucking works and is in python
#Class from daanaerts.com
#
class ssh:
    client = None

    def __init__(self,address,port,username,password):
        print("[*] Connecting to " + address)
        self.client = client.SSHClient()
        self.client.set_missing_host_key_policy(client.AutoAddPolicy())
        self.client.connect(address, port, username=username, password=password, look_for_keys=False)


    def sendCommand(self,command):
        if(self.client):
            stdin, stdout, stderr = self.client.exec_command(command)
	    
	    #Some printing shit that i sorta understand
            while not stdout.channel.exit_status_ready():
                if stdout.channel.recv_ready():
                    alldata = stdout.channel.recv(1024)

                    while stdout.channel.recv_ready():
                        alldata += stdout.channel.recv(1024)

                    print(str(alldata, "utf8"))
        else:
	    #I honestly don't think this will ever get hit but oh well
            print("[-] Error: Connection Not Opened")


#Deploying starts here
print("[*] Deploy script starting..." )
thefile = input("[*] Enter a file with IP addresses: (hosts.txt) ") or "hosts.txt"

randpass = ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(8))

#Catch this error dawg
try:
    fd = open(thefile,'r')
except IOError:
    print("[-] Error: File does not exsist")
    exit()

for line in fd:
    
    #Grab user input. Designed so you can just spam enter a shit ton
    theuser = input("[*] Enter a user to connect to %s: (root) " % line.replace('\n','')) or "root"
    theport = input("[*] Enter the port ssh is listening on: (22) ") or 22
    thepassword = input("[*] Enter the password for %s: (changeme) " % theuser) or "changeme"
    thenewpass = input("[*] Enter a new password for {0}: ({1})".format(line.replace('\n',''),randpass )) or randpass
    try:
        connection = ssh(line,int(theport),theuser,thepassword)
    except socket_error:
	#DONT CONNECT TO ME OR MY BOX EVER AGAIN
        print("[-] Error: Cannot SSH to {0}, are we already pwned? :/".format(line.replace('\n','')))
        exit()
    connection.sendCommand("mkdir itworked; cd itworked; touch childern;")

print("[+] Done")
