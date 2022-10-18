# QBFT

The purpose of this repo is to facilitate building private versions of the EVM Engine using the Consensys Quorum Byzantine Fault Tolerant (QBFT) version of geth. 

A single person can build out five nodes in parallel on one server. This process is described in:

https://consensys.net/docs/goquorum/en/latest/tutorials/private-network/create-qbft-network/

This requires an updates version of geth:

https://consensys.net/docs/goquorum/en/latest/deploy/install/binaries/#release-binaries

You will also need Nodejs (Version 15 or Later):

https://nodejs.org/en/download/

I run Apache2 and PHP, and will provide a copy of my simple PHP front-end. 

Finally, geth uses two ports to talk to the other nodes and to allow Metamask or any other wallet to connect. These are not secured with HTTPS. In order to secure these, I use NGINX to do a reverse-proxy that allows port 127.0.0.1 to be broadcast publicly. 

Other things:

It is possible to run this on Linux or on a Mac. It is also possible in Windows by using WSL (Windows Subsystem for Linux). I will include a Windows section to specifically address this.  

You can build out all five nodes yourself, but it would be better to join an existing Quorum public network. Therefore, I will provide an existing network which I am calling Zork ][. If you configure a node to join this network, then we will allow you to connect in.

Cheers.
