
# Egon Blockchain Node

This project aims to provide installation, running and maintence capabilities of **egon validator node** for potential and existing Egon Blockchain backers. The consensus structure of this chain is delegated proof of stake "DPos" and is governed by symbiosis of egon's implementation of go-ethereum and our system contracts [https://github.com/EgonChain/System-Smart-Contracts]. This repository has multiple release candidates inline so we recommending checking for updates for better functions and stability.


## Acknowledgements
Egon blockchain node inherits it's core components from heco-chain project by stars-lab which itself is based on geth by ethereum foundation.

 - [Go ethereum](https://github.com/ethereum/go-ethereum)
 - [heco-chain](https://github.com/stars-labs/heco-chain)

The revolution started by bitcoin and later fuled by Ethereum Foundation has launched a wide array of technological advancements and it's applications.
We acknowledge and actively contribute in decentralization cause and derivatives.
## System Requirements

**Operating System:** Ubuntu >= 20.04 LTS

**RAM:** 8GB minimum, 32GB recommended

**Persistant Storage:** 25GB minimum, 100GB high speed SSD recommended

**Note regarding use of GPUs -** GPUs are primirarily used in POW consensus chains.Being a DPos Egon chain has not only more tps and fast block production but also doesn't need a GPU altogether for its purpose.



## How to become a validator
To back the Egon blockchain you can become a validator. Full flow for becoming a validator, you must:
* Install this package **(See Installation)**
* Download your newly created validator wallet from your server and import it in your metamask or preferred wallet. Fund this account with appropriate EGC needed to become a validator. Example command to download wallet on your local PC:
```bash
  scp -r root@<server_ip>:/root/EgonCoin-Core/chaindata/node1/keystore
  scp root@<server_ip>:/root/EgonCoin-Core/chaindata/node1/pass.txt
```
* On your server, start the node that you just installed **(See Usage/Example)**
* Once node is started and confirmation is seen on your terminal, open the interactive console by attaching tmux session **(See Usage/Example)**
* Once inside the interactive console, you'll see "TRANSACTION OBJECT IMPORT" and "age=<some period like 6d5hr or 5mon 3weeks>". You need to wait until "unauthorized validator" warning starts to pop-up on the console. 
* Once "unauthorized validators" starts to show up, go to https://staking.egonscan.com and click "Become a validator". Fill in all the details in the form, in the "Fee address" field enter the validator wallet address that you imported in your metamask. Proceed further
* Once the last step is done, you'll see "Signed Potential Block" message on interactive console. You'll also see your validator wallet as a validator on staking page and on explorer. You should also dettach from console after whole process is done **(See Usage/Example)**
## Installation

**You must ensure that:** 
* system requirements are meet with careful supervision
* the concerned server/local setup must be running 24/7 
* there is sufficient power and cooling arrangment for your machine if running a local setup 
If failed you may end up loosing your stake in the blockchain and your staked coins, if any. You'll be jailed at once with no return point by the blockchain if found down/dead. You'll be responsible for chain data corruption on your node, frying up your motherboard or damaging yourself and surroundings. 


To install egon validator node in ubuntu linux
```bash
  sudo -i
  apt update && apt upgrade
  apt install git tar curl wget
  reboot
```
Skip above coommands if you have already updated the system and installed necessary tools.

Connect again to your server after reboot
```bash
  sudo -i
  git clone https://github.com/EgonChain/Egoncoin-Core.git
  cd EgonChain-Core
  ./node-setup --validator 1
```
After you run node-setup, follow on screen instructions carefully and your'll get confirmation that node was succsfully installed on your system.

**Note regarding your validator account -** While in setup process, you'll asked to create a new account that must be used for block mining and reciving gas rewards. You must import this account to your metamask or any preferred wallet. 
 
    
## Usage/Examples

To create/install a validator node. Fresh first time install
```bash
./node-setup.sh --validator 1
```
To run the validator node
```bash
./node-start.sh --validator
```
To get into a running node's interactive console/tmux session 
```bash
tmux attach -t node1
```
To exit/dettach from an interactive console
```text
press CTRL & b , release both keys and press d
```


## Authors

- [swaraj @hide001](https://www.github.com/hide001)
