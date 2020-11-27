#!/bin/bash

position2=0
position1=0
numOfTimesPlayed=0

function snakeLadder() {
        echo "Players added at" $position1 "position"
        option
	echo "Number of Times Dice was Rolled = " $numOfTimesPlayed
}

function rollDice() {
        dice=$((RANDOM%6+1))
	numOfTimesPlayed=$((numOfTimesPlayed+1))
}

function option(){
	while [[ $position1 -lt 100 && $position2 -lt 100 ]]
	do
		rollDice
		optionDice=$((RANDOM%3+1))

	        case $optionDice in
        	1) echo "Option: No Play" ;;

	        2) position1=$((position1+$dice))
		   echo "Option: Ladder"

			if [[ position1 -gt 100 ]]
			then
				position1=$((position1-$dice))
			fi		 ;;

	        3) position1=$((position1-$dice))
		   echo "Option: Snake"

	               	if [[ position1 -le 0 ]]
                	then
                	   position1=0
                	fi 		;;
		esac
		echo "Player1 Position" $position1

		rollDice
		optionDice=$((RANDOM%3+1))
                case $optionDice in
                1) echo "Option: No Play" ;;

                2) position2=$((position2+$dice))
                   echo "Option: Ladder"

                        if [[ position2 -gt 100 ]]
                        then
                                position2=$((position2-$dice))
                        fi               ;;

                3) position2=$((position2-$dice))
                   echo "Option: Snake"

                        if [[ position2 -le 0 ]]
                        then
                           position2=0
                        fi              ;;
                esac
		 echo "Player2 Position" $position2
		 echo "**************************"
	done

	if [[ position1 -gt position2 ]]
	then
		echo "Player1 Won the game"
	else
		echo "Player2 Won the game"
	fi
}

echo "Snake and Laddder Game Started"

snakeLadder
