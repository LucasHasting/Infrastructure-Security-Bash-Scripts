#!/bin/sh

iptables -F

iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport http -j ACCEPT
iptables -A INPUT -p tcp --dport ssh -j ACCEPT
iptables -A INPUT -p icmp -j  ACCEPT
iptables -A INPUT -j DROP

iptables -A OUTPUT -o lo -j ACCEPT
iptables -A OUTPUT -p udp --dport domain -j ACCEPT
iptables -A OUTPUT -p udp --dport ntp -j ACCEPT
#iptables -A OUTPUT -p tcp --dport http -j ACCEPT
#iptables -A OUTPUT -p tcp --dport https -j ACCEPT
iptables -A OUTPUT -p icmp -j  ACCEPT
iptables -A OUTPUT -j DROP
