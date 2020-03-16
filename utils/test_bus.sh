#!/bin/bash

set -e

param_ok=no
for p in {1..4}; do
	if [ "$1" = "$p" ]; then
		param_ok=yes
		break
	fi
done
if [ "$param_ok" != "yes" ]; then
	echo Usage: $0 bus# > /dev/stderr
	exit 1
fi

DEVICE=$(./audio-router.py find)
BUS=$1

./audio-router.py $DEVICE clear
for relay in {1..12}; do
	./audio-router.py $DEVICE connect $relay bus $BUS
done
./audio-router.py $DEVICE commit

echo Press Enter for 13..24
read dummy
./audio-router.py $DEVICE clear
for relay in {13..24}; do
	./audio-router.py $DEVICE connect $relay bus $BUS
done
./audio-router.py $DEVICE commit

echo Press Enter to clear
read dummy
./audio-router.py $DEVICE clear
./audio-router.py $DEVICE commit

