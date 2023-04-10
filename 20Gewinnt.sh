#!/bin/bash

echo 'Wilkommen zu 20 Gewinnt.'
echo 'Wer zuerst 20 erreicht gewinnt!'
echo 'Du kannst immer um 1 oder 2 erhöhen.'
echo

gameCount=0
livio=12

checkIfWon() {
    if [ $(($1 + $2)) -ge 20 ]
    then
        local gameCount=$(($1 + $2))
        echo "$3"
        echo "Game count: $gameCount"
        exit
    fi
}

while [ $gameCount -lt 20 ]
do
    echo 'Deine Eingabe: '
    read userInput
    echo

    if ! [[ $userInput =~ ^(1|2)$ ]]
    then
        echo "Die Eingabe $userInput ist eine ungültige Eingabe"
        continue
    fi

    checkIfWon $userInput $gameCount "Du hast gewonnen!!!"

    gameCount=$(($gameCount + $userInput))

    echo "Der Computer ist am zug..."
    sleep 1
    computer=$((RANDOM % 2 + 1))
    echo "Der Computer hat eine $computer gewählt"
    echo

    checkIfWon $gameCount $computer "Der Computer hat gewonnen!!!"

    gameCount=$(($gameCount + $computer))

    echo "Der Game Count ist: $gameCount"
    echo
done