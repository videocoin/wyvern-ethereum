ABIGEN_DOCKER=docker run \
	-v $(shell pwd):/solidity \
	-v $(shell pwd)/build:/build \
	--rm -ti ethereum/solc:0.4.23

.PHONY: abi
abi:
	mkdir -p build/
	SOLC="${ABIGEN_DOCKER}" ./scripts/solc.sh /build/ /solidity /solidity/contracts/WyvernExchange.sol

.PHONY: bindings
bindings:
	mkdir -p bindings/
	abigen --abi build/WyvernExchange.abi --bin build/WyvernExchange.bin --pkg bindings --out bindings/WyvernExchange.go --type WyvernExchange