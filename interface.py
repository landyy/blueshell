#!/usr/bin/env python3

import subprocess
import os

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
    
    if(userinput == "exit"):
        print("[*] Exiting interface... ")
        exit()

    if(userinput == "deploy"):
        if(os.path.isfile("python_deploy.py")):
            print("[*] Running deploy script...")
            os.system("./python_deploy.py")
    
        else:
            print("[-] Deploy Script not found")
