#!/usr/bin/env python3

import subprocess
import os

DEBUG = True

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

while True:
    
    userinput = input(bcolors.OKBLUE + "[blueshell]$ " + bcolors.ENDC)
    command = userinput.split()


    if(command[0] == "exit"):
        print("[*] Exiting interface... ")
        exit()

    elif(command[0] == "deploy"):
        if(os.path.isfile("python_deploy.py")):
            print("[*] Running deploy script...")
            os.system("./python_deploy.py")
    
        else:
            print("[-] Deploy Script not found")

    elif(command[0] == "exec"):
        if(len(command) >= 2):
            
            #find the length of the array so we can pass all the arguments
            length = len(command)
            finalcommand=""
            for i in range(1,length):
                finalcommand+=command[i]
                finalcommand+=" "
            
            #DEBUG statement 
            if(DEBUG):
                print("[!] Executing command %s" % finalcommand)
            
            #special case with cd. God this is such spaghetti code
            if(command[1] == "cd"):
                    os.chdir(command[2])
            
            os.system(finalcommand)
        else:
            print("[?] Usage: exec COMMAND")
