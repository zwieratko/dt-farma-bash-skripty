#! /usr/bin/env bash

#
#Great Pictures Finder
#

# Try to find all pics (*.png / *.bmp / *.jpg)
PICLIST=$(sudo find / -type f -regex '.+\.\(png\|bmp\|jpg\)' 2>/dev/null)
TOTALPIC=$(echo "$PICLIST" | wc -l)

cube=0
landscape=0
portrait=0
wrong=0
while read -r line
do
  #echo "$line"
  size=$(file "$line" | grep -oE '[0-9]{1,4}\s?[xX]\s?[0-9]{1,4}')
  #echo "$size"
  xpic=$(echo "$size" | sed -n '/x/{p;q}' | awk -F'x' '{print $1}')
  ypic=$(echo "$size" | sed -n '/x/{p;q}' | awk -F'x' '{print $2}')
  if [ "$xpic" -eq "$ypic" ]
  then
    cube=$((cube+1))
  elif [ "$xpic" -gt "$ypic" ]
  then
    landscape=$((landscape+1))
  elif [ "$xpic" -lt "$ypic" ]
  then
    portrait=$((portrait+1))
  else
    wrong=$((wrong+1))
    echo "$line"
    echo "$size"
  fi
done <<<"$PICLIST"

echo "We have total $TOTALPIC pictures in the system."
echo "Cube : $cube"
echo "Land : $landscape"
echo "Port : $portrait"
echo "Wron : $wrong"
echo "Tot  : $((cube+landscape+portrait+wrong))"

exit 0