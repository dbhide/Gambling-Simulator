#!/bin/bash -x

echo "Welcome to Gambling Simulation Problem"

declare -A dailyDeal

#Constants
STAKE=100
BET=1
NUMBER_OF_DAYS=20

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
	resultAmount=$(( $amount - $STAKE ))
	echo $resultAmount
}

function obtainTotalAmount() {
	for(( i=1; i<=NUMBER_OF_DAYS; i++ ))
	do
		totalAmount=$(( totalAmount + $(calculativeGambler) ))
		dailyDeal[Day$i]=$totalAmount
	done

	echo ${!dailyDeal[@]}
	echo ${dailyDeal[@]}

	if [[ $totalAmount -gt 0 ]]
	then
		echo "Total Amount Won = $totalAmount "
	else
		echo "Total Amount Lost = $totalAmount"
	fi
}

function checkLuck() {
	for j in ${!dailyDeal[@]}
	do
		echo "$j  ${dailyDeal[$j]}"
	done | sort -k2 -rn
}

function nextPlay() {
	while [[ $totalAmount -gt 0 ]]
	do
		read -p "Would you like to Play next month? [Y/N]" choice
		if [ $choice == "Y" ]
		then
			obtainTotalAmount
			echo "Lucky Day is " $(checkLuck | head -1)
			echo "Unlucky Day is " $(checkLuck | tail -1)
			nextPlay
		fi
		break
	done
	echo "OOPS!! Not enough amount..Can't play next Month"
}

obtainTotalAmount
nextPlay
