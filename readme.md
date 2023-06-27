This package is developed for Egon Chain and must be used strictly for only Egon Mainnet. You are required to follow the instruction given as it is. If a problem occurs please get in touch with the developer.
This directory contains node source code, node setup, and startup script. 

In order to become a validator in Egon Mainnet you first need to set up and start the node:

--------------------- NODE SETUP -------------------------------------------------------
Follow the instructions given here
https://docs.google.com/document/d/1l-tcXkaM9hbKzKwgyy6ejOuuMtdKp-De8IrZfMHRVCM/edit?usp=sharing
------------------------------------------------------------------------------------------


---------------------- NODE START -------------------------------------------------------
1.  ./node-start.sh

To attach running tmux session: tmux attach -t 0 
To detach running tmux session: press CTRL + b, then release both keys and press d
To exit the node once inside tmux session: type "exit" and enter

----------------------------------------------------------------------------------------

Once you have set up the node and started it, you need to import your wallet from the node server(as instructed in setup/startup scripts), fund it with the appropriate required funds then go to https://staking.egcscan.com/ and click "Become a validator" by following the instructions there.

Please note: Note setup is only required for the first time. i.e., when you have a new server with no prior running egon nodes. Once the setup.sh is done on a given server, you don't need to interact with ./node-setup.sh file. You can safely interact with ./node-start.sh script even after 1st time.

Future updates will be pushed to the EgonChain GitHub repository. Stay tuned for advanced feature updates.
