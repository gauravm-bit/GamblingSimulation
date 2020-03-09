#!/bin/bash -x

echo "Welcome to Gambler Simulation problem"

#CONSTANTS
STAKE=100
BET=1
FIFTYPERCENTAGE=$(($STAKE*50/100))
MINIMUMSTAKE=$(($STAKE - $FIFTYPERCENTAGE))
MAXIMUMSTAKE=$(($STAKE + $FIFTYPERCENTAGE))

#variables
currentStake=STAKE
bets=0

#Win or loose

while [[ currentStake -gt MINIMUMSTAKE &&
			 currentStake -lt MAXIMUMSTAKE ]]
do
	randomCheck=$(( RANDOM%2 ))
	if (( $randomCheck == 0 ))
	then
		currentStake=$(($currentStake + $BET))
	else
		currentStake=$(($currentStake - $BET))
	fi
done
