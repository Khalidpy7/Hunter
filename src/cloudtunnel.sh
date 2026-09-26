#!/bin/bash

BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
RESET='\033[0m'


# generating public cloud flared url.
generate_public_LINK() {
  # input zphisher generates url.
  echo -ne "${YELLOW} [?] Enter Zphisher url : ${RESET}"
  read server_url
  
  # starts cloudFlares tunnel to get public url.
  cloudflared tunnel --url ${server_url}
}

# grt public server link.
generate_public_LINK