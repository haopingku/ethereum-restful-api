# Ethereum RESTful API
This is a practice of a set of RESTful API to query Ethereum state using Ruby on Rails and Geth.
Before using, please install Ethereum by (on Ubuntu 16.04)
```bash
$ sudo apt update
$ sudo apt install software-properties-common
$ sudo add-apt-repository -y ppa:ethereum/ethereum
$ sudo apt update
$ sudo apt install ethereum
```
Connect to Ethereum network.
Start geth RPC server
```bash
$ geth --rpc --rpcapi admin,eth,miner
```
URLs in this API
`GET /node`
`GET /block/<block_hash>` to query specified block
`GET /transaction/<transaction_hash>` to query specified transaction
`PUT /miner` to start miner
`DELETE /miner` to stop miner
and these APIs return JSON.
(If the returned JSON has "error" field, it implies that errors happened)
