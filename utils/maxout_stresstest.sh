#!/bin/bash

set -e

DEVICE=$(./audio-router.py find)

./audio-router.py $DEVICE clear
for relay in {1..24}; do
	for bus in {1..4}; do
		./audio-router.py $DEVICE connect $relay bus $bus
	done
done
./audio-router.py $DEVICE commit

