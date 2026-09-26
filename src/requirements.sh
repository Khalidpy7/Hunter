#!/bin/bash

# RUNS WITHOUT ERROR ON KALI LINUX.
# RUN THIS FILE BEFORE STARTING THIS TOOL.
# OTHERWISE ERRORS COMES OUT.
# MAKE SURE YOU RUN THIS TOOL.
# THIS FILE RUNNING COMMAMD sudo ./requirements.sh or ./requirements.sh or bash requirements.sh

BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
RESET='\033[0m'


# DEPENDENCIES FOR PHISHING TOOL ZPHISHER.
phishing_dependencies(){
  for cmd in python3 curl git php ;
  do
    if command -v $cmd >/dev/null 2>&1 ;
    then
      echo -e "${GREEN}[*] ${cmd} is installed.${RESET}\n"
    else
      echo -e "${RED}[!] ${cmd} not installed. ${RESET}\n"
      sudo apt install ${cmd} 
    fi
  done
}

# DEPENDENSIES FOR CLOUDFLARED.
cloudflared() {
  
  # Update kali linux terminal.
  sudo apt update
  
  # Installs curl and certificate files. -y automatically answers yes.
  sudo apt install -y curl ca-certificates
  
  # Creates the keyring directory.
  sudo mkdir -p --mode=0755 /usr/share/keyrings
  
  # Downloads a file from a URL.
  curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | sudo tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null
  
  # Writes input into a file with administrator permission.
  echo "deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared any main" | sudo tee /etc/apt/sources.list.d/cloudflared.list
  
  # Installs Cloudflared.
  sudo apt install cloudflared
  
  # check succesfully installed or not.
  cloudflared --version
  
}

# execution of dependencies
phishing_dependencies
cloudflared

