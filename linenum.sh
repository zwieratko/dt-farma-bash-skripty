#! /bin/sh

# Add line number at the beginning of every line

LINENUM=0

while read -r LINE
do

    if [ "$LINE" = "quit" ]
    then
        echo "Exit."
        exit 0
    fi
    LINENUM=$((LINENUM + 1))
    NEWLINE="$LINENUM $LINE"
    echo "$NEWLINE"

done

exit 0