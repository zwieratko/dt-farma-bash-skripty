#! /bin/sh

# Simple while loop test

while [ "$LINE" != "quit" ] && [ "$LINE" != "exit" ]
do

    read -r LINE
    echo "$LINE"

done
exit 0