#!/bin/bash

position=0
numOfTimesPlayed=0

function snakeLadder() {
        echo "Player added at" $position "position"
        option
        echo "Position after dice rolled=" $position
	echo "Number of Times Dice was Rolled = " $numOfTimesPlayed
}

function rollDice() {
        dice=$((RANDOM%6+1))
	numOfTimesPlayed=$((numOfTimesPlayed+1))
        echo "Dice Rolled =" $dice
}

function option(){
	while [[ $position -lt 100 ]]
	do
		rollDice
		optionDice=$((RANDOM%3+1))

	        case $optionDice in
        	1) echo "Option: No Play" ;;

	        2) position=$((position+$dice))
		   echo "Option: Ladder"

			if [[ position -gt 100 ]]
			then
				position=$((position-$dice))
			fi		 ;;

	        3) position=$((position-$dice))
		   echo "Option: Snake"

	               	if [[ position -le 0 ]]
                	then
                	   position=0
                	fi 		;;
		esac
	echo "Position = "$position
	done
}

echo "Snake and Laddder Game Started"
snakeLadder
