#! /usr/bin/env bash

cisla=$(cat cisla.txt)
while read -r line
do
  echo "xxx: $line"
done <<< "$cisla"

exit 0