#! /bin/sh

#
# Great Password Generator
#

# Choose random name from file if exist
if [ -f ~/scripts/pass-gen-01-mena.txt ]
then
  RANDOMNAME=$(shuf -n 1 ~/scripts/pass-gen-01-mena.txt)
else
  echo "Sorry, we have no big file with name."
  RANDOMNAME="radovan"
fi

# Choose random 4 digits number
RANDOMNUMBER=""
while [ "${#RANDOMNUMBER}" -lt 4 ]
do
  RANDOMNUMBER="$RANDOMNUMBER"$(shuf -i 0-9 -n 1)
done

# Create the new random password
NEWPASSWORD="$RANDOMNAME$RANDOMNUMBER"
echo "$NEWPASSWORD"

exit 0