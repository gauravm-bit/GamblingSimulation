#!/bin/bash -x

echo "Welcome to Gambler Simulation problem"

#CONSTANTS
STAKE=100
BET=1
FIFTYPERCENTAGE=$(($STAKE*50/100))
MINIMUMSTAKE=$(($STAKE - $FIFTYPERCENTAGE))
MAXIMUMSTAKE=$(($STAKE + $FIFTYPERCENTAGE))

#variables
currentStake=$STAKE
wins=0
loss=0

#Win or loose

for(( i = 1; i <= 20; i++ ))
do
	currentStake=$STAKE
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
	if (( $currentStake == MAXIMUMSTAKE ))
	then
		((wins++))
	else
		((loss++))
	fi
done

TotalWins=$(($wins * $FIFTYPERCENTAGE))
TotalLosses=$(($loss * $FIFTYPERCENTAGE))

echo "Total amount won in 20 days is "$TotalWins
echo "Total amount lost in 20 days is "$TotalLosses



