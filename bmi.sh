#! /bin/sh

echo "Vitaj $USER"
echo "Zadaj svoju hmotnost prosim v kg: "
read -r HMOTNOST
echo "Zadaj este svoju vysku v cm: "
read -r VYSKACM

VYSKA=$( echo "scale=2; $VYSKACM / 100" | bc )
#echo "$VYSKA"
VYSKA2=$(echo "$VYSKA * $VYSKA" | bc)
#echo "$VYSKA2"
BMI=$(echo "$HMOTNOST / $VYSKA2" | bc)
#echo "$BMI"

if [ "$BMI" -lt 19 ]
then
    BMISLOVNE="podvahu"
else
    if [ "$BMI" -le 25 ]
    then
        BMISLOVNE="optimalnu vahu"
    else
        BMISLOVNE="nadvahu"
    fi
fi

echo "Tvoje BMI ma hodnotu: $BMI."
echo "A mas teda $BMISLOVNE."
echo "Pekny den este."

exit 0