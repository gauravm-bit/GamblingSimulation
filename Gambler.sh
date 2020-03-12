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
monthlystake=0
day=0
result=""

declare -a monthlyStakeArray
#Win or loose
read -p "Enter the number of months: " month

for(( index = 1; index <=month; index++))
do
   for(( i = 1; i <= 20; i++ ))
   do
      currentStake=$STAKE
      while [[ currentStake -ge MINIMUMSTAKE &&
                currentStake -le MAXIMUMSTAKE ]]
      do
         randomCheck=$(( RANDOM%2 ))
         if (( $randomCheck == 0 ))
         then
            currentStake=$(($currentStake + $BET))
         else
            currentStake=$(($currentStake - $BET))
         fi
      done
      if (( $currentStake > MAXIMUMSTAKE ))
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
		monthlyStakeArray[$day]=$monthlystake
		echo "$day day $FIFTYPERCENTAGE $result $monthlystake"
   done
	luckiestDay=${monthlyStakeArray[1]}
	unluckiestDay=${monthlyStakeArray[1]}
	for (( i=1; i<=${#monthlyStakeArray[@]}; i++ ))
	do
			if (( luckiestDay < ${monthlyStakeArray[$i]}))
			then
				luckiestDay=${monthlyStakeArray[$i]}
				luckyDay=$i
			elif ((unluckiestDay > ${monthlyStakeArray[$i]} ))
			then
				unluckiestDay=${monthlyStakeArray[$i]}
				unluckyDay=$i
			fi
	done
TotalWins=$(($wins * $FIFTYPERCENTAGE))
TotalLosses=$(($loss * $FIFTYPERCENTAGE))
echo "Total win for the month "$TotalWins
echo "Total loss for the month "$TotalLosses
echo "luckiest day is $luckyDay = $luckiestDay"
echo "unluckiest day is $unluckyDay = $unluckiestDay"
monthlstake=0
win=0
loss=0
day=0
done

