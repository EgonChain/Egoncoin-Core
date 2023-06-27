#!/bin/bash
#set -x

GREEN='\033[0;32m'
RED='\033[0;31m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color
CHAINID=271
BOOTNODE="enr:-KO4QGl7a66W33H8OWaXf8x5PozmqNmq2h_m54nzAOvz7IrBC76dXuDIpfKRtXBsEc9plN5Akn-npVIGm8dqG6zbbmaGAYjJpccMg2V0aMfGhCTk9KiAgmlkgnY0gmlwhJ9ZaBmJc2VjcDI1NmsxoQLC89St0j332GYrdzXrg7dZe_wjDc61Lt6vB_lbPeOXN4RzbmFwwIN0Y3CCf5yDdWRwgn-c"

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
