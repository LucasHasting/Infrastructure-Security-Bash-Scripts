#!/bin/sh

# count successful logins and check if an unauthorized account
# has been used to login
# LH, 03/18/2024

AUTHORIZED_USERS=2

COUNT=$(last | cut -d ' ' -f1 | sort | uniq | egrep -v 'reboot|wtmp|^$' | wc -l)

if [ $COUNT -gt $AUTHORIZED_USERS ];
then
  logger -p local0.alert "login_count.sh: New User Login Detected: $COUNT"
fi