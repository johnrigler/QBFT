#!/bin/bash

NODE=0

export ADDRESS=$(grep -o '"address": *"[^"]*"' ./data/keystore/accountKeystore | grep -o '"[^"]*"$' | sed 's/"//g');
    export PRIVATE_CONFIG=ignore;
    nohup geth \
	    --datadir data \
	    --networkid 39692 \
	    --nodiscover \
	    --verbosity 5 \
	    --syncmode full \
	    --istanbul.blockperiod 5 \
	    --mine --miner.threads 1 \
	    --miner.gasprice 0 \
	    --emitcheckpoints \
	    --http \
	    --http.addr 127.0.0.1 \
	    --http.port 2400$NODE \
	    --http.corsdomain "*" \
	    --http.vhosts "*" \
	    --ws \
	    --ws.addr 127.0.0.1 \
	    --ws.port 3400$NODE \
	    --ws.origins "*" \
	    --http.api admin,eth,debug,miner,net,txpool,personal,web3,istanbul \
	    --ws.api admin,eth,debug,miner,net,txpool,personal,web3,istanbul \
	    --unlock ${ADDRESS} \
	    --allow-insecure-unlock \
	    --password ./data/keystore/accountPassword \
	    --port 3040$NODE &
