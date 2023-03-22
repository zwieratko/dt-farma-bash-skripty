#! /usr/bin/env bash

for x in 1 2 3 4

do
    echo $x
done

x=8
y=2
i=0
echo "$i"

echo "---"

echo "expr"
a=$( expr $x + $y )
echo "expr $x + $y = $a"
i=$( expr $i + 1 )
echo "$i"

echo "---"

echo "double parentheses"
b=$(( x + y ))
echo "\$(( $x + $y )) = $b"
(( i += 1 ))
echo "$i"

echo "---"

echo "let"
let c=x+y
echo "let $c=$x+$y"
let "i += 1"
echo "$i"

exit 0