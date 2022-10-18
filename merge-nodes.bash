#!/bin/bash

merge-nodes() {
cd ./$1
pwd 
ls *.json
# FIRST=$(cat static-nodes.json | grep -v ']')
# echo $FIRST","
cat new-static-nodes.json
}

merge-nodes $1
