#! /bin/sh

#
# Great Backup Tool
#

ARCHIVENAME="radovan-$(date +%F_%H-%M-%S).tar.gz"
echo "$ARCHIVENAME"

# Create new archive from /etc at local machine
echo "We try to create tar.gz archive from /etc..."
sudo tar -czf "$ARCHIVENAME" /etc
EXITTAR="$?"
echo "Exit status of archiving operation: $EXITTAR"

# Send new archive to remote machine via ssh
echo "We try to send the archive via ssh..."
scp ./"$ARCHIVENAME" telekom@127.0.0.1:/tmp
EXITSCP="$?"
echo "Exit status of transfer operation: $EXITSCP"

# If both operations was succesful, we can remove local archive
if [ "$EXITTAR" -eq 0 ] && [ "$EXITSCP" -eq 0 ]
then
  echo "Removing archive from local machine..."
  rm "$ARCHIVENAME"
else
  echo "Something is not OK!"
fi

exit 0