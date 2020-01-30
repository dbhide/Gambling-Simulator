#!/bin/bash -x

echo "Welcome to Gambling Simulation Problem"
#Constants
STAKE=100
BET=1

function computePercentage() {
   MAXIMUM_STAKE=$(( $STAKE+(50*$STAKE/100) ))
   MINIMUM_STAKE=$(( $STAKE-(50*$STAKE/100) ))
}

#Variables
amount=$STAKE

computePercentage

function calculativeGambler() {
	while [[ $amount -gt $MINIMUM_STAKE && $amount -lt $MAXIMUM_STAKE ]]
	do
		if [[ $((RANDOM%2)) -eq 1 ]]
		then
   		amount=$(( $amount+$BET ))
		else
   		amount=$(( $amount-$BET ))
		fi
	done
}

calculativeGambler
