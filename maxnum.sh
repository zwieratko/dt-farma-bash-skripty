#! /bin/sh

# find max number value from user given numbers

MAXVALUE=0

while [ "$NUMBER" != "quit" ]
do
    echo "Type the next number (or quit)"
    read -r NUMBER
    
    if [ "$NUMBER" -gt "$MAXVALUE" ] 2>/dev/null
    then 
        MAXVALUE="$NUMBER"
    fi
done

echo "The max given number is: $MAXVALUE"

exit 0