#!/bin/bash

userInput=0

checkIfWon() {
        if [ $(($1 + $2)) -ge 20 ]
        then
            local gameCount=$(($1 + $2))
            echo -e "\e[34m$3\e[0m"
            echo -e "\e[34mGame count: $gameCount\e[0m"
            exit
        fi
    }

while [ true ]
do
    echo -e "\e[34mWähle einen Modus aus oder falls du das Spiel nicht kennst schau dir das turotial an.\e[0m"

    echo -e "\e[34m1)PvE\n2)PvP\n3)PCvsPC\n4)Tutorial\e[0m"
    read modusSelection

    if ! [[ $modusSelection =~ ^(1|2|3|4)$ ]]
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
            echo -e "\e[34mWilkommen zu PCvsPC\e[0m"
            echo -e "\e[34mHier wird 20 Gewinnt simuliert\e[0m"
            echo

            computerOne="computerOne"
            computerTwo="computerTwo"

            gameCount=0

            while [ $gameCount -lt 20 ]
            do
                echo -e "\e[34mDer Computer $computerOne ist am zug...\e[0m"
                sleep 2
                computerOneInput=$((RANDOM % 2 + 1))
                echo -e "\e[35m$computerOne hat $computerOneInput gewählt\e[0m"
                echo

                checkIfWon $computerOneInput $gameCount "Der Computer $computerOne hat gewonnen!!!"
                gameCount=$(($gameCount + $computerOneInput))
                echo -e "\e[34mDer Game Count ist $gameCount\e[0m"
                echo

                echo -e "\e[34mDer Computer $computerTwo ist am zug...\e[0m"
                sleep 2
                computerTwoInput=$((RANDOM % 2 + 1))
                echo -e "\e[35m$computerTwo hat $computerTwoInput gewählt\e[0m"
                echo

                checkIfWon $computerTwoInput $gameCount "Der Computer $computerTwo hat gewonnen!!!"
                gameCount=$(($gameCount + $computerTwoInput))
                echo -e "\e[34mDer Game Count ist $gameCount\e[0m"
                echo

            done

        elif [ $modusSelection -eq 4 ]
        then
            echo -e "\e[34mWilkommen zum Tutorial...\e[0m"
            sleep 3
            echo -e "\e[34mDas Ziel des Spieles ist es 20 zu errichen.\nDu kannst jedes mal wenn du dran kommst um 1 oder 2 erhöhen.\e[0m"
            sleep 3
            echo -e "\e[34mHier ein Beispiel: \e[0m"
            sleep 3
            echo -e "\e[34mDein Gegener beginnt, er macht die Eingabe 1.\e[0m"
            sleep 3
            echo -e "\e[34mDu hast jetzt die möglichkeit den Game Count auf 2 oder 3 zu erhöhen in dem du 1 oder 2 eingibst.\e[0m"
            sleep 3
            echo
            echo -e "\e[34mGib 1 ein um wieder ins Menü zu gelangen oder 2 um das Programm zu beenden\e[0m"
            read userInput

            if [ $userInput -eq 1 ]
            then
                continue
            else
                exit
            fi

        else
            echo -e "\e[34mKeine gültige Eingabe\e[0m"
    fi
done