#! /usr/bin/env bash

i=0
for x in 1 2 3 4 5
do
    i=$( expr "$i" + 1 )
done
echo "$i"

i=0
for x in 1 2 3
do
    (( i += 1 ))
done
echo "$i"

i=0
for x in 1 2 3 4 5 6 7 8
do
    let i+=1
done
echo "$i"