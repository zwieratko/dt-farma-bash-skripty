#! /bin/sh

# Simple bash calculator

while true
do
  echo "Type the first number (or q for quit) :"
  read -r firstnum
  if [ "$firstnum" = "q" ]
  then
    echo "Bye."
    exit 0
  fi
  echo "Type the math operations (+-*/^) :"
  read -r mathop
  echo "Type the second number :"
  read -r secondnum

  case "$mathop" in
    "+") result=$(awk -vx="$firstnum" -vy="$secondnum" 'BEGIN{print x+y}')
    ;;
    "-") result=$(awk -vx="$firstnum" -vy="$secondnum" 'BEGIN{print x-y}')
    ;;
    "*") result=$(awk -vx="$firstnum" -vy="$secondnum" 'BEGIN{print x*y}')
    ;;
    "/") result=$(awk -vx="$firstnum" -vy="$secondnum" 'BEGIN{print x/y}')
    ;;
    "^") result=$(awk -vx="$firstnum" -vy="$secondnum" 'BEGIN{print x**y}')
    ;;
    *) result="NA"
  esac

  echo "Result:"
  echo "$firstnum $mathop $secondnum = $result"
  echo
done

exit 0