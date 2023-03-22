#! /bin/sh

LINENUM=0
OKUSER=0

echo "Vitaj admin, ideme pridavat novych uzivatelov."

while read -r LINE
do

    LINENUM=$((LINENUM+1))
    echo "Citam data z riadku c. $LINENUM"
    USERNAME=$(echo "$LINE" | cut -d: -f1)
    echo "Uzivatelske meno: $USER"
    PASS=$(echo "$LINE" | cut -d: -f2)
    echo "Uzivatelske heslo: $PASS"
    useradd -m "$USERNAME"
    NAVRATOVAUSER=$?
    echo "$PASS" | passwd --stdin "$USERNAME"
    NAVRATOVAPASS=$?
    if [ "$NAVRATOVAUSER" -eq 0 ] && [ "$NAVRATOVAPASS" -eq 0 ]
    then
        OKUSER=$((OKUSER+1))
    fi

done <newusers.txt

echo "Uloha splnena, bolo pridanych $OKUSER novy(ch) uzivatel(ov)."
exit 0