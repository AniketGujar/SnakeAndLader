#!/bin/bash

function snakeladder() {
        position=0;
        echo "Player added at" $position "position"
	rollDice
}

function rollDice() {
        dice=$((RANDOM%6+1))
        echo $dice
}


snakeladder
