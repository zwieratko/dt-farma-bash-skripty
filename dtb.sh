#! /bin/sh

# dtb.sh
# Days To Birthday
#

# set -Eeuo pipefail

current_time=$(date +%s)
this_year=$(date +%Y)

printf "Hello %s!\n" "$USER"
printf "And what is your real name?\n"
read -r user_name
printf "Hi %s, how are you?\n" "$(echo "$user_name" | sed 's/^./\u&/')"

# Validate user input - date of birth
# Date of birth must be in the past
can_continue="no"
while [ "$can_continue" = "no" ] ; do
    printf "\nWhat is your year of birth?\n"
    echo "Type 4 digit year of birth: "
    read -r user_year
    printf "\nWhat is your month of birth?\n"
    echo "Type 2 digit month of birth: "
    read -r user_month
    printf "\nAnd what is your day of birth?\n"
    echo "Type 2 digit day of birth: "
    read -r user_day
    printf "\nYour date of birth is: %s-%s-%s\n" "$user_year" "$user_month" "$user_day"
    birthday_time=$(date -d "$user_year-$user_month-$user_day" "+%s" 2>/dev/null)
    conversion_result=$?
    #printf "ct: $current_time\n"
    #printf "bt: $birthday_time\n"
    if [ "$conversion_result" -eq 0 ] && [ "$birthday_time" -lt "$current_time" ]; then
        printf "OK.\n"
        can_continue="yes"
    elif [ "$conversion_result" -eq 0 ] && [ "$birthday_time" -ge "$current_time" ]; then
        printf "Sorry, it is not possible. Your date of birth will be in the future.\n"
        printf "One more time, please.\n"
    else
        printf "Date is not correct, sorry. One more time, please.\n"
    fi
done

# Calculate number of days till next birthday
this_bd=$(date -d "$this_year-$user_month-$user_day" "+%s")
next_bd=$(date -d "$((this_year+1))-$user_month-$user_day" "+%s")
sec_to_bd=$((this_bd-current_time))
if [ "$sec_to_bd" -gt 0 ] ; then
    day_to_bd=$((sec_to_bd/86400))
    user_age=$((this_year-user_year))
elif [ "$sec_to_bd" -lt 0 ] ; then
    sec_to_bd=$((next_bd-current_time))
    day_to_bd=$((sec_to_bd/86400))
    user_age=$((this_year+1-user_year))
fi
printf "\n"
printf "%s days till your birthday :)\n" "$day_to_bd"
printf "And you will be %s years old.\n" "$user_age"
printf "\n"
exit 0