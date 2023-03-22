#! /bin/sh

# Really simple bash calculator

while true
do
  echo "Type first number (or q for quit) :"
  read -r firstnum
  if [ "$firstnum" = "q" ]; then
    echo "Bye."
    exit 0
  fi
  echo "Type the math operation (+-*/^) :"
  read -r mathop
  echo "Type the second number :"
  read -r secondnum
  if [ "$mathop" = "+" ];then result=$((firstnum+secondnum));fi
  if [ "$mathop" = "-" ];then result=$((firstnum-secondnum));fi
  if [ "$mathop" = "*" ];then result=$((firstnum*secondnum));fi
  if [ "$mathop" = "/" ];then result=$((firstnum/secondnum));fi
  if [ "$mathop" = "^" ];then
    result=1
    i=1
    while [ "$i" -le "$secondnum" ]; do
      result=$((result*firstnum))
      i=$((i+1))
    done
  fi
  echo "Result:"
  echo "$firstnum $mathop $secondnum = $result"
  echo
done

exit 0