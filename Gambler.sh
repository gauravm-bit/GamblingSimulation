#!/bin/bash -x

echo "Welcome to Gambler Simulation problem"

#CONSTANTS
STAKE=100
BET=1

#variables
currentStake=STAKE

#Win or loose
randomCheck=$(( RANDOM%2 ))
if (( randomCheck == 0 ))
then
	currentStake=$(($currentStake + $BET))
else
	currentStake=$(($currentStake - $BET))
fi
 
