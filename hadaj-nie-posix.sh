#! /bin/bash

# Uhadni cislo
RANDNUM=$(( RANDOM % 20 ))
USERNUM=0
ITERATION=1

echo "UHADNI CILSO"
while test "$RANDNUM" -ne "$USERNUM"
do

    echo "Zadaj cislo na ktore myslim (pokus c. $ITERATION): "
    read -r USERNUM
    ITERATION=$(( ITERATION + 1 ))
    if test "$ITERATION" -gt 5
    then
        echo "Prekrocil si maximalny pocet pokusov."
        echo "Koniec hry."
        exit 1
    fi

    #echo "Tvoj typ je: $USERNUM"
    if test "$USERNUM" = "koniec"
    then
        echo "Ukoncil si hru."
        exit 0
    fi

    if test "$RANDNUM" -eq "$USERNUM"
    then
        echo "Uhadol si !"
        exit 0
    else
        echo "Zly typ"
        if test "$USERNUM" -gt "$RANDNUM"
        then
            echo "$USERNUM je prilis velke, hadaj mensie"
        else
            echo "$USERNUM je prilis male, hadaj vacsie"
        fi
    fi

done

exit 0