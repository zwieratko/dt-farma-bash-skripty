#! /bin/sh

x=2
y=3

echo "$x / $y = ..."

z=$(awk -vx="$x" -vy="$y" 'BEGIN{OFMT="%.2f";print(x/y)}' )
echo "$z"

exit 0