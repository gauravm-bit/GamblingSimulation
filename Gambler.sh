#!/bin/bash

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
monthlystake=0
day=0
result=""


#Win or loose

for(( index = 1; index <=3; index++))
do
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
			monthlystake=$(( $monthlystake + $FIFTYPERCENTAGE ))
			result="win"
		else
			((loss++))
			mothlystake=$(( $monthlystake + $FIFTYPERCENTAGE ))
			result="loose"
		fi
	((day++))
	echo "$day day $FIFTYPERCENTAGE $result"
	done
TotalWins=$(($wins * $FIFTYPERCENTAGE))
TotalLosses=$(($loss * $FIFTYPERCENTAGE))
echo "Total win for the month "$TotalWins
echo "Total loss for the month "$TotalLosses
monthlstake=0
win=0
loss=0
day=0
done



