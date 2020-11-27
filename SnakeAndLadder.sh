#!/bin/bash

position=0

function snakeLadder() {
        echo "Player added at" $position "position"
	rollDice
}

function rollDice() {
        dice=$((RANDOM%6+1))

        echo "Dice Rolled=" $dice
	option
	echo "Position after dice rolled=" $position
}

function option(){
	optionDice=$((RANDOM%3+1))

        case $optionDice in
        1) position=0
	   echo "Option: No Play" ;;

        2) position=$((position+$dice))
	   echo "Option: Ladder" ;;

        3) position=$((position-$dice))
	   echo "Option: Snake"
                if [[ position -le 0 ]]
                then
                   position=0
                fi 		;;
	esac
}

echo "Snake and Laddder Game Started"
snakeLadder
