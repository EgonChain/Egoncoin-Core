This package is developed for Egon Chain and must be used strictly for only Egon Mainnet. You are required to follow instruction given as it is. If problem occurs please contact the developer.
This directory contains node source code, node setup and startup script. 

In order to become a validator in Egon Mainnet you first need to setup and start node:

--------------------- NODE SETUP -------------------------------------------------------
1. Open terminal where egon_mainnet_package.tar.gz is located
2. Enter tar xzf ./egon_mainnet_package.tar.gz
3. rm -rf ./egon_mainnet_package && cd ./egon_mainnet_package
4. Enter chmod a+x ./node-setup.sh
5. ./node-setup.sh 0 1
6. Now follow along the program, read instruction there care fully
7. Once node is setup you can start node
------------------------------------------------------------------------------------------


---------------------- NODE START -------------------------------------------------------
1.  ./node-start.sh

To attach running tmux session: tmux attach -t 0 
To dettach running tmux session: press CTRL + b , then release both keys and press d
To exit node once inside tmux session: type "exit" and enter

----------------------------------------------------------------------------------------

Once you have setup the node and started it, you need to import your wallet from node server(as instructed in setup/startup scripts), fund it with appropriate required funds then go to https://staking.egcscan.com/ and click "Become a validator" by following instructions there.

Please note: Note setup is only required for first time. i.e, when you have a new server with no prior running egon nodes. Once the setup.sh is done on a given server then no need to interact with ./node-setup.sh file. You can safely interact with ./node-start.sh script even after 1st time.

Future updates will be pushed to @EtherAuthority, @hide001 and Egonchain github repositories. Stay tuned for advance features updates.
