#! /bin/sh

# Determine if the given year is leap or not

echo "Determine if the given year is leap or not."
while true
do

    echo "Type the year to check (q for quit)"
    read -r Y

    if [ "$Y" = "q" ] || [ "$Y" = "Q" ]
    then
        echo "Quit."
        exit 0
    elif [ $((Y%4)) -eq 0 ] && [ $((Y%100)) -ne 0 ]
    then
        result="leap"
        result2="It means february has 29 days."
    elif [ $((Y%4)) -eq 0 ] && [ $((Y%100)) -eq 0 ] && [ $((Y%400)) -eq 0 ]
    then
        result="leap"
        result2="It means february has 29 days."
    else
        result="not leap"
    fi
    echo "Year $Y is $result. $result2"

done

exit 0