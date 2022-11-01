#!/bin/bash

# This script creates the necessary files before starting Celestia-appd

# only create the priv_validator_state.json if it doesn't exist and the command is start
if [[ $1 == "start" && ! -f /config/data/priv_validator_state.json ]]
then
    mkdir /config/data # it is alright if it fails, the script will continue executing
    cat <<EOF > /config/data/priv_validator_state.json
{
  "height": "0",
  "round": 0,
  "step": 0
}
EOF
fi

curl --silent --location https://raw.githubusercontent.com/celestiaorg/networks/master/mamaki/genesis.json --output /config.celestia-app/config/genesis.json

/app/celestia-appd --home /config $@