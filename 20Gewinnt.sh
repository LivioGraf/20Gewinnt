#!/bin/bash

echo -e '\e[34mWilkommen zu 20 Gewinnt.\e[0m'
echo -e '\e[34mWer zuerst 20 erreicht gewinnt!\e[0m'
echo -e '\e[34mDu kannst immer um 1 oder 2 erhöhen.\e[0m'
echo

gameCount=0
livio=12

checkIfWon() {
    if [ $(($1 + $2)) -ge 20 ]
    then
        local gameCount=$(($1 + $2))
        echo -e "\e[34m$3\e[0m"
        echo -e "\e[34mGame count: $gameCount\e[0m"
        exit
    fi
}

while [ $gameCount -lt 20 ]
do
    echo -e '\e[35mDeine Eingabe: \e[0m'
    read userInput
    echo

    if ! [[ $userInput =~ ^(1|2)$ ]]
    then
        echo -e "\e[34mDie Eingabe $userInput ist eine ungültige Eingabe\e[0m"
        continue
    fi

    checkIfWon $userInput $gameCount "Du hast gewonnen!!!"

    gameCount=$(($gameCount + $userInput))

    echo -e "\e[36mDer Computer ist am zug...\e[0m"
    sleep 1
    computer=$((RANDOM % 2 + 1))
    echo -e "\e[36mDer Computer hat eine $computer gewählt\e[0m"
    echo

    checkIfWon $gameCount $computer "Der Computer hat gewonnen!!!"

    gameCount=$(($gameCount + $computer))

    echo -e "\e[34mDer Game Count ist: $gameCount\e[0m"
    echo
done