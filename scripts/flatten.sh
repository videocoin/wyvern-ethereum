#!/bin/sh

rm -rf temp
mkdir -p temp

cd contracts
find . -type f -name "*.sol" -exec sed -i 's/pragma solidity 0.4.23/pragma solidity ^0.4.23/g' {} +
cd ..

alias flatten="./node_modules/.bin/solidity-flattener"

flatten contracts/WyvernAtomicizer.sol --output temp/WyvernAtomicizer.sol
flatten contracts/WyvernTokenTransferProxy.sol --output temp/WyvernTokenTransferProxy.sol
flatten contracts/WyvernDAOProxy.sol --output temp/WyvernDAOProxy.sol
flatten contracts/WyvernToken.sol --output temp/WyvernTokenFlattened.sol
flatten contracts/WyvernDAO.sol --output temp/WyvernDAOFlattened.sol
flatten contracts/WyvernExchange.sol --output temp/WyvernExchangeFlattened.sol
flatten contracts/WyvernProxyRegistry.sol --output temp/WyvernProxyRegistryFlattened.sol

cd contracts
find . -type f -name "*.sol" -exec sed -i 's/pragma solidity ^0.4.23/pragma solidity 0.4.23/g' {} +
cd ..
