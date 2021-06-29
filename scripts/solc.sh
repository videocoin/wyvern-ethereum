#!/bin/bash

SOLC=${SOLC:-solc}

build=$1
deps=$2
contract=$3

$SOLC --abi -o $build --overwrite --allow-paths $deps openzeppelin-solidity=$deps/node_modules/openzeppelin-solidity $contract
$SOLC --bin -o $build --overwrite --allow-paths $deps openzeppelin-solidity=$deps/node_modules/openzeppelin-solidity $contract