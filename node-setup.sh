#!/bin/bash
#set -x

GREEN='\033[0;32m'
RED='\033[0;31m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color



if [[ $# -eq 0 ]] ; then
    echo 'No arguments given, see manual'
    exit 1
fi


totalRpc=$1
totalValidator=$2
totalNodes=$(($totalRpc + $totalValidator))


if [[ $totalNodes -eq 0 ]]; then
        echo "Wrong arguments given, see manual"
        exit 1
fi


echo "Total RPC to be created: $totalRpc"
echo "Total Validators to be created: $totalValidator"
echo "Total nodes to be created: $totalNodes"

echo -e "${GREEN}\t\t\t_________________________________________________________________________________________________________________${NC}\n"

echo -e "${RED}\t\t\t\t\t\t Egon Mainnet Node Setup"
# getting os info
echo -e "\t\t\t\t\t\t\tTarget OS: Ubuntu 20.04 LTS (Focal Fossa)"
echo -e "\t\t\t\t\t\t\tYour OS: $(. /etc/os-release && printf '%s\n' "${PRETTY_NAME}")"

echo -e "${GREEN}\t\t\t_________________________________________________________________________________________________________________${NC}"



# ---------------------------------------------------------------------------------------------------------------------------------------------


# update and upgrade the server
echo -e "\n\n${ORANGE}TASK: ${GREEN}[running upgrade]${NC}\n"
apt update && apt upgrade -y

# installing build-essential
echo -e "\n\n${ORANGE}TASK: ${GREEN}[installing build-essential]${NC}\n"
apt -y install build-essential tree

# getting golang
echo -e "\n\n${ORANGE}TASK: ${GREEN}[getting golang v 1.17.3]${NC}\n"
cd ./tmp && wget "https://go.dev/dl/go1.17.3.linux-amd64.tar.gz"

# setting up golang
echo -e "\n\n${ORANGE}TASK: ${GREEN}[installing golang]${NC}\n"
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.17.3.linux-amd64.tar.gz
echo "PATH=$PATH:/usr/local/go/bin" >> /etc/profile
export PATH=$PATH:/usr/local/go/bin
go env -w GO111MODULE=off

# set proper group and permissions
echo -e "\n\n${ORANGE}TASK: ${GREEN}[setting up group and permissions]${NC}\n"
ls -all
cd ../
ls -all
chown -R root:root ./
chmod a+x ./node-start.sh

# do make all
echo -e "\n\n${ORANGE}TASK: ${GREEN}[making all]${NC}\n"
cd node_src
make all

# setting up directories and structure for node/s
echo -e "\n\n${ORANGE}TASK: ${GREEN}[setting up directories]${NC}\n"

cd ../

i=1
while [[ $i -le $totalNodes ]] ; do
   mkdir ./chaindata/node$i
  (( i += 1 ))
done

tree ./chaindata

echo -e "\n\n${ORANGE}TASK: ${GREEN}[getting password for account]${NC}\n"
echo -e "\n${ORANGE}This step is very important. Input a password that will be used for a newly created validator account. In next step you will recieve a public key for your validator account"
echo -e "${ORANGE}Once a validator account is created using your given password, I'll give you where the keystore file is located so you can import it in metamask\n\n${NC}"


i=1
while [[ $i -le $totalValidator ]] ; do

   echo -e "Enter password: "
   read password
   echo $password > ./chaindata/node$i/pass.txt
   ./node_src/build/bin/geth --datadir ./chaindata/node$i account new --password ./chaindata/node$i/pass.txt
   ./node_src/build/bin/geth --datadir ./chaindata/node$i init ./genesis.json
  (( i += 1 ))
done

# start the node
echo -e "\n Your newly created account and password is located at ./chaindata/node[1,2...n]"
echo -e "\n\n${ORANGE}STATUS: ${GREEN}ALL TASK PASSED!\n This program will now exit\n Now run ./node-start.sh${NC}\n"








