#! /bin/sh

stats=""
echo "%   user"
echo "============"

# collect the data
for user in $(ps aux | tail -n+2 | awk '{print $1}' | sort -u)
do
  stats="$stats\n$(ps aux | grep ^"$user" | awk 'BEGIN{total=0}; \
    {total += $4};END{print total,$1}')"
done

# sort data numerically (largest first)
printf '%b' "$stats" | grep -v ^$ | sort -rn | head

exit 0