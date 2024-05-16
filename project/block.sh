#!/bin/sh
# Count the numeber of failed root logins via ssh
# and block IP addresses that have more that MAX attempts

#max attempts
MAX=10

#get attempts in format: attempt:address
ATTEMPTS=$(cat auth.log | grep 'User root' | cut -d' ' -f9 | sort -n | uniq -c | awk '{printf "%s:%s\n",$1,$2}')

#for each entry in attempts
for ENTRY in $ATTEMPTS
do
	#get each indivual item
	ATTEMPT=$(echo $ENTRY | cut -d':' -f1)
	ADDRESS=$(echo $ENTRY | cut -d':' -f2)

	#block IP and log if attempt > max attempts
	if [ $ATTEMPT -gt $MAX ];
	then
		iptables -A INPUT -s $ADDRESS -j DROP
	        echo "block.sh: BLOCKED $ADDRESS AFTER $ATTEMPT ATTEMPTS" >> /etc/syslog.conf
	fi
done
