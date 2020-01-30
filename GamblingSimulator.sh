#!/bin/bash -x

echo "Welcome to Gambling Simulation Problem"

STAKE=100
BET=1

if [[ $((RANDOM%2)) -eq 1 ]]
then
	echo "BET WON"
else
	echo "BET LOST"
fi
