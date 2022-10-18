#!/bin/bash

merge-nodes() {

# HOST may need to be 127.0.0.1, localhost, or an IP.

HOST=`hostname`
cd ./$1
ls *.json
cat new-static-nodes.json | grep -v '\[' >> $$.last

(
cat static-nodes.json | head -n -1 | sed '$ s/$/,/'
cat $$.last | sed "s/HOST>/$HOST/" | sed 's/<//g'
) > final-static-nodes.json 
rm $$.*
}

merge-nodes "Node-0/data" 

# This is how you pass in a location
# merge-nodes $1
