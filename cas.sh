#! /bin/sh

echo "Ahoj Rado"
echo "Dnes je $(date +'%d.%m.%Y')"
echo "A prave je $(date +'%H:%M')"

PRAVE_TERAZ=$(date +'%s')
PRACOVNA_DOBA_DO="16:30:00"
KONIEC_PRACE=$(date -d "$(date +'%Y/%m/%d') $PRACOVNA_DOBA_DO" "+%s")
HODINY=$(date +'%-H')
MINUTY=$(date +'%-M')
OST_HOD=$((23-HODINY))
OST_MIN=$((59-MINUTY))
DEN=$(date +'%u')   # den v tyzdni, 1-pondelok, 2-utorok...

if [ "$DEN" -ge 1  ] && [ "$DEN" -le 5 ] && [ "$PRAVE_TERAZ" -lt "$KONIEC_PRACE" ]; then
    OST_SEK_PRAC=$((KONIEC_PRACE-PRAVE_TERAZ))
    OST_HOD_PRAC=$(awk -v var1="$OST_SEK_PRAC" -v var2=3600 'BEGIN { printf "%.1f", ( var1 / var2 ) }')
    echo "Do konca pracovnej doby ($PRACOVNA_DOBA_DO) ostava este nejakych $OST_SEK_PRAC sekund."
    echo "Co je das $OST_HOD_PRAC hod."
else
    echo "Nie je pracovna doba :)"
    echo "Chvala Bohu!"
fi

case $OST_HOD in
    1) HOD="hodina" ;;
    2|3|4) HOD="hodiny" ;;
    *) HOD="hodin" ;;
esac

case $OST_MIN in
    1) MIN="minuta" ;;
    2|3|4) MIN="minuty" ;;
    *) MIN="minut" ;;
esac

echo "A do konca dna ostava $OST_HOD $HOD a $OST_MIN $MIN."

exit 0