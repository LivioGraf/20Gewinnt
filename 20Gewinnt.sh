#!/bin/bash
echo -e "\e[34mWähle einen Modus aus\e[0m"

echo -e "\e[34m1)PvE\n2)PvP\n3)PCvsPC\e[0m"
read modusSelection

checkIfWon() {
    if [ $(($1 + $2)) -ge 20 ]
    then
        local gameCount=$(($1 + $2))
        echo -e "\e[34m$3\e[0m"
        echo -e "\e[34mGame count: $gameCount\e[0m"
        exit
    fi
}

if ! [[ $modusSelection =~ ^(1|2|3)$ ]]
then
    echo -e "\e[34mKeine gültige Eingabe\e[0m"
fi

if [ $modusSelection -eq 1 ]
then
    echo -e '\e[34mWilkommen zu 20 Gewinnt.\e[0m'
    echo -e '\e[34mWer zuerst 20 erreicht gewinnt!\e[0m'
    echo -e '\e[34mDu kannst immer um 1 oder 2 erhöhen.\e[0m'
    echo

    echo -e "\e[34mGib deinen Namen hier ein: \e[0m"
    read userName

    gameCount=0

    while [ $gameCount -lt 20 ]
    do
        echo -e "\e[35m$userName du bist am Zug (1 oder 2): \e[0m"
        read userInput
        echo

        if ! [[ $userInput =~ ^(1|2)$ ]]
        then
            echo -e "\e[34mDie Eingabe $userInput ist eine ungültige Eingabe\e[0m"
            continue
        fi

        checkIfWon $userInput $gameCount "Der Spieler $userName hat gewonnen!!!"

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

    elif [ $modusSelection -eq 2 ]
    then
        echo -e "\e[34mWilkommen zum PvP Modus!!!\e[0m"
        echo -e '\e[34mWer zuerst 20 erreicht gewinnt!\e[0m'
        echo -e '\e[34mIhr könnt immer um 1 oder 2 erhöhen.\e[0m'
        echo

        echo -e "\e[34mSpieler 1 gib bitte deinen Namen ein: \e[0m"
        read playerOne
        echo

        echo -e "\e[34mSpieler 2 gib bitte deinen Namen ein: \e[0m"
        read playerTwo
        echo

        gameCount=0

        while [ $gameCount -lt 20 ]
        do
            echo -e "\e[34m$playerOne du bist am Zug (1 oder 2): \e[0m"
            read playerOneInput

            if ! [[ $playerOneInput =~ ^(1|2)$ ]]
            then
                echo -e "\e[34mDie Eingabe $playerOneInput ist eine ungültige Eingabe\e[0m"
                continue
            fi

            checkIfWon $playerOneInput $gameCount "Der Spieler $playerOne hat gewonnen!!!"
            gameCount=$(($gameCount + $playerOneInput))

            echo -e "\e[34mDer Game Count ist $gameCount.\e[0m"

            while [ true ]
            do
                echo -e "\e[34m$playerTwo du bist am Zug: \e[0m"
                read playerTwoInput

                if ! [[ $playerTwoInput =~ ^(1|2)$ ]]
                then
                    echo -e "\e[34mDie Eingabe $playerTwoInput ist eine ungültige Eingabe\e[0m"
                else
                    break
                fi
            done
            
            checkIfWon $playerTwoInput $gameCount "Der Spieler $playerTwo hat gewonnen!!!"
            gameCount=$(($gameCount + $playerTwoInput))

            echo -e "\e[34mDer Game Count ist: $gameCount\e[0m"

        done
    
    elif [ $modusSelection -eq 3 ]
    then
        echo "PCvsPC"

    else
        echo -e "\e[34mKeine gültige Eingabe\e[0m"
fi