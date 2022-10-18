#!/bin/bash

# build.bash accepts one parameter, which is node number
# if you don't give a paramater, it will assume Node-0

function create-artifacts() {

# ChainID is the default for the Zork ][ project

npx quorum-genesis-tool \
	--consensus qbft \
       	--chainID 39692 \
       	--blockperiod 5 \
       	--requestTimeout 10 \
       	--epochLength 30000 \
       	--difficulty 1 \
   	--gasLimit '0xFFFFFF' \
   	--coinbase '0x0000000000000000000000000000000000000000' \
   	--validators 1 \
  	--members 0 \
   	--bootnodes 0 | tee $$
}

if [[ "xx$1xx" == "xxxx" ]]
then
        NODE=0
else
        NODE=$1
	echo "This script only supports one node at this time"
	exit
fi

# If you only have one artifact directory, then this
# will find it until the year 2100, but hopefully
# this will be changed before then. If you have more 
# than one artifact directory, then either hide one or
# fix the script. Pull requests appreciated.

create-artifacts

ARTIFACTS=$(grep "Artifacts" $$ | cut -c 24-)

echo $ARTIFACTS

mkdir -p Node-$NODE/data/keystore
cd Node-$NODE/data
cp ../../$ARTIFACTS/goQuorum/genesis.json .
cp ../../$ARTIFACTS/goQuorum/static-nodes.json new-static-nodes.json 
ln -s ../../static-nodes.json .

for x in address nodekey.pub
do
cp ../../$ARTIFACTS/validator0/$x .
done

cd keystore

for x in $(ls ../../../$ARTIFACTS/validator0/account*)
do
 cp $x .
done
cd ../..

 geth --datadir data init data/genesis.json

 cp ../$ARTIFACTS/validator0/nodekey data/geth/nodekey

 cp ../start-node.bash .
 cd ..

 echo
 echo
 echo "You should have a new node in the 'Node-$NODE' directory"
 echo "You will need to change Node-$NODE/data/new-static-nodes.json"
 echo "to be the correct static-nodes.json for the project"

 echo "You will need to set your hostname when you add new-static-nodes.json"
 echo "to static-nodes.json"

 grep --color '<HOST>' new-static-nodes.json

 echo 
 echo "You might also need to find an opened port"

 echo "Finally, you can use the start-node.bash command in your"
 echo "data directory to start, but you may need to make some"
 echo "adjustments"

 rm $$
