#! /usr/bin/env bash

#
#Great Pictures Finder
#

# Try to find all pics (*.png / *.bmp / *.jpg)
PICLIST=$(sudo find / -type f -regex '.+\.\(png\|bmp\|jpg\)' 2>/dev/null | head -300)
TOTALPIC=$(echo "$PICLIST" | wc -l)
echo "We have total $TOTALPIC pictures in the system."

# Try to determine how many pics are at landscape / portrait form
COUNTER=0
CUBE=0
LANDSCAPE=0
PORTRAIT=0
WRONG=0
echo >Pcub.txt
echo >Plan.txt
echo >Ppor.txt
echo >Pwrong.txt
while read -r LINE
do
  #echo "$LINE"
  COUNTER="$((COUNTER+1))"
  XPIC=$(file "$LINE" | awk -F"," '{print $2}' | awk -F" " '{print $1}')
  YPIC=$(file "$LINE" | awk -F"," '{print $2}' | awk -F" " '{print $3}')
  #echo "Pic.n.: $COUNTER / x: $XPIC / y: $YPIC"
  if [ "$XPIC" -eq "$YPIC" ] 2>/dev/null
  then
    CUBE=$((CUBE+1))
    echo "$LINE" > Pcub.txt
  elif [ "$XPIC" -gt "$YPIC" ] 2>/dev/null
  then
    LANDSCAPE=$((LANDSCAPE+1))
    echo "$LINE" > Plan.txt
  elif [ "$XPIC" -lt "$YPIC" ] 2>/dev/null
  then
    PORTRAIT=$((PORTRAIT+1))
    echo "$LINE" > Ppor.txt
  else
    WRONG=$((WRONG+1))
    echo "$LINE" > Pwrong.txt
  fi
done <<< "$PICLIST"
echo "Final result:"
echo "Cube pic : $CUBE"
echo "Landscape: $LANDSCAPE"
echo "Portrait : $PORTRAIT"
echo "Wrong    : $WRONG"

exit 0