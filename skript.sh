#! /bin/sh

# Toto je komentar
# nebude to interpretovane
# kratky popis co skript robi a akym sposobom

SRC="/etc/passwd /etc/group"
DATUM=$(date +"%Y-%m-%dT%H-%M-%S%z")
FILE="/tmp/zaloha-$DATUM.tar"
LOGFILE="/tmp/zaloha-log-$DATUM.log"
ERRORFILE="/tmp/zaloha-chyba-$DATUM.log"

echo "Ahoj $USER"

if test -z "$1"
then
    echo "Nezadal si param"
    echo "Zadaj co zalohovat: "
    read -r SRC
    #exit 1
else
    SRC=$1
fi

tar -cf "$FILE" "$SRC" >"$LOGFILE" 2>"$ERRORFILE"
NAVRAT=$?
echo "Navratova hodnota: $NAVRAT"

if test "$NAVRAT" -eq 0
then
    echo "Zalohovanie skoncene"
    exit 0
else
    echo "Chyba"
    exit 1
fi