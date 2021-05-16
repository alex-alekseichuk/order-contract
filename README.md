### This is a test dapp as a smart contract by solidity for ether networks.

I use local `ganache` instance to developer and test it.
I use `truffle` suite to build the contracts, the migration script and the test.
Then deploy the contracts into local `ganache` and run test against it.

After that I register an account in `MetaMask` and faucet it via twitter post.
I try to deploy it via truffle -> geth -> Rinkeby, but my local `geth` node doesn't see the funds I faucet.
So, I registered `infura` project, and try to deploy via it.
But the tx is pending...


```
➜  order-contract yarn truffle migrate --network rinkeby
yarn run v1.22.10
$ node_modules/.bin/truffle migrate --network rinkeby

Compiling your contracts...
===========================
> Everything is up to date, there is nothing to compile.



Migrations dry-run (simulation)
===============================
> Network name:    'rinkeby-fork'
> Network id:      4
> Block gas limit: 10000000 (0x989680)


1_initial_migration.js
======================

   Deploying 'Migrations'
   ----------------------
   > block number:        8595341
   > block timestamp:     1621165485
   > account:             0x2C52240f00b6dc4D61E51ba634875e0A177674Ab
   > balance:             2.999999999996284197
   > gas used:            176943 (0x2b32f)
   > gas price:           0.000000021 gwei
   > value sent:          0 ETH
   > total cost:          0.000000000003715803 ETH

   -------------------------------------
   > Total cost:     0.000000000003715803 ETH


2_add_order_db_migration.js
===========================

   Deploying 'OrderDatabase'
   -------------------------
   > block number:        8595343
   > block timestamp:     1621165501
   > account:             0x2C52240f00b6dc4D61E51ba634875e0A177674Ab
   > balance:             2.999999999972235963
   > gas used:            1117816 (0x110e78)
   > gas price:           0.000000021 gwei
   > value sent:          0 ETH
   > total cost:          0.000000000023474136 ETH


   Deploying 'Client'
   ------------------
   > block number:        8595344
   > block timestamp:     1621165514
   > account:             0x2C52240f00b6dc4D61E51ba634875e0A177674Ab
   > balance:             2.999999999966604204
   > gas used:            268179 (0x41793)
   > gas price:           0.000000021 gwei
   > value sent:          0 ETH
   > total cost:          0.000000000005631759 ETH

   -------------------------------------
   > Total cost:     0.000000000029105895 ETH


Summary
=======
> Total deployments:   3
> Final cost:          0.000000000032821698 ETH

