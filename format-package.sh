#!/bin/bash
set -e

GREEN='\033[0;32m'
RED='\033[0;31m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color

#########################################################################
totalRpc=0
totalValidator=0
totalNodes=$(($totalRpc + $totalValidator))

#########################################################################

#+-----------------------------------------------------------------------------------------------+
#|                                                                                                                              |
#|                                                      FUNCTIONS                                                |
#|                                                                                                                              |     
#+------------------------------------------------------------------------------------------------+

countNodes(){
  local i=1
  totalNodes=$(ls -l | grep -c ^d)
  while [[ $i -le $totalNodes ]]; do
    
    if [ -f "./chaindata/node$i/.rpc" ]; then  
      # ((++totalRpc))
      ((totalRpc += 1))
    else  
        if [ -f "./chaindata/node$i/.validator" ]; then
        # ((++totalValidator))
        ((totalValidator += 1))
        fi
    fi  
    
    ((i += 1))
  done 
}

displayStatus(){
  # start the node
  echo -e "\n${GREEN}All the existing node installation and corresponding data has been deleted "
}

task1(){
  # update and upgrade the server TASK 1
  echo -e "\n\n${ORANGE}TASK: ${RED}[FORMATTING INSTALLATION]${NC}\n"
        while true; do
                read -p "Are you sure want to continue and completly format & delte all the existing node installations? (Y/N) " yn
                case $yn in
                        [Yy]* ) 
                                        echo -e "${RED} Format in progress..."
                                        cd ./chaindata
                                        rm -rf ./*
                                        cd ../tmp
                                        rm -rf ./*
                                        cd ../
                                        displayStatus
                                 break;;
                        [Nn]* ) exit;;
                        * ) echo "Please answer yes or no.";;
                esac
        done
  echo -e "\n${GREEN}[TASK PASSED]${NC}\n"
}

displayWelcome(){
  # display welcome message
  echo -e "\n\n\t${ORANGE}Total RPC installed: $totalRpc"
  echo -e "\t${ORANGE}Total Validators installed: $totalValidator"
  echo -e "\t${ORANGE}Total nodes installed: $totalNodes"
  echo -e "\n\n${ORANGE}
  \t+------------------------------------------------------------------+
  \t|   PAY ATTENTION !
  \t|   Running this tool will delete all exixting node installation and corresponding data
  \t|   Remember to backup any data that you need before running this
  \t+------------------------------------------------------------------+
  ${NC}\n"

  echo -e "${ORANGE}
  \t+------------------------------------------------+
  \t+------------------------------------------------+
  ${NC}"
}


#########################################################################

#+-----------------------------------------------------------------------------------------------+
#|                                                                                                                             |
#|                                                                                                                             |
#|                                                      MAIN                                                            |
#|                                                                                                                             |
#|                                                                                                                             |
#+-----------------------------------------------------------------------------------------------+
finalize(){
  countNodes
  displayWelcome
  task1
}

finalize