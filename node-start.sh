#!/bin/bash
#set -x

GREEN='\033[0;32m'
RED='\033[0;31m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color
CHAINID=271
BOOTNODE="enr:-KO4QIHbnaFqynfKyahm6gFJgv6H5IeMN1Mpjlslez5ZH30WO7jg2d3QQcbDryUkUmJVQWOLi20OuVOLZnsCvg0WBIaGAYj2nuoCg2V0aMfGhJWbL-OAgmlkgnY0gmlwhJ9ZaBmJc2VjcDI1NmsxoQJjuhSKk2g_JmHfi6co-0QCeSRMjRQEKzCWn1s7_K7LtIRzbmFwwIN0Y3CCf5yDdWRwgn-c"

echo -e "${GREEN}**********************************************************************"
echo -e "Starting node"


    if tmux has-session -t 0 > /dev/null 2>&1; then
        :
    else
        tmux new-session -d -s 0
        tmux send-keys -t 0 "./node_src/build/bin/geth --datadir ./chaindata/node1 --networkid $CHAINID --bootnodes $BOOTNODE --mine --unlock 0 --password ./chaindata/node1/pass.txt --syncmode=full console" Enter
    fi

echo -e "${ORANGE}Node started\nEnter tmux attach -t 0 to see node in action${NC}"
echo -e "\n\n\n${ORANGE}Now give your tmux-geth instance sometime to sync till the recent block. Once it's done you can go to staking page and activate your validator by staking"
echo -e "\n\n${ORANGE}Remember to import the account's key store file into you metmask for staking.${NC}"
