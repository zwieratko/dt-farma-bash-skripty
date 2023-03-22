#! /bin/sh

USERNUM=3
BASENAME="student"
PASS="password"

for X in $(seq 1 "$USERNUM")
do
    echo "$BASENAME$X"
    useradd -m "$BASENAME$X"
    echo "$PASS" | passwd --stdin "$BASENAME$X"

done

exit 0