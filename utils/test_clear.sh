#!/bin/bash

set -e

DEVICE=$(./audio-router.py find)

./audio-router.py $DEVICE clear
./audio-router.py $DEVICE commit

