#!/bin/bash

# Hunter is a Bash-based security awareness and phishing simulation tool.
# It is designed to demonstrate common phishing techniques in a
# controlled and authorized environment. Hunter helps users understand
# suspicious links, fake login pages, and common phishing indicators
# without collecting real credentials or sensitive information.

BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
RESET='\033[0m'

__version__=1.0

banner() {
	cat <<- EOF
  ${CYAN}░█░█░█░█░█▀█░▀█▀░█▀▀░█▀▄
  ${CYAN}░█▀█░█░█░█░█░░█░░█▀▀░█▀▄
  ${CYAN}░▀░▀░▀▀▀░▀░▀░░▀░░▀▀▀░▀░▀${RED}${__version__}
  
  ${YELLOW}CREATED BY : ${RED} KHALID.S ${RESET}
  
	EOF
}

# displays tool banner
banner

# for geting phishing server url.
url() {
  
  # give executable permusdion to zphisher.sh
  chmod +x zphisher.sh
  
  #massage.
  echo -e "${CYAN} after executing this tools copy phishing link. open new tab and run command ${YELLOW}bash cloudtunnel.sh ${RESET}"
  
  # run run zphisher.sh file.
  sudo ./zphisher.sh
}

# execute zphisher interface.
url()
 

