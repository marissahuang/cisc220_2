#!/bin/bash

# Deven Bernard     - 10099810
# Marissa Huang     - 10179169
# Kevin Zuern       - 10134425
# Quentin Petraroia - 10145835

# Clear previous rules
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD

# Enable SSH from 130.15.0.0-130.15.255.255 & any private IP
iptables -A INPUT -s 130.15.0.0/16 -p TCP --dport 22 -j ACCEPT
iptables -A INPUT -s 10.0.0.0/8 -p TCP --dport 22 -j ACCEPT
iptables -A INPUT -s 172.16.0.0/12 -p TCP --dport 22 -j ACCEPT
iptables -A INPUT -s 192.168.0.0/16 -p TCP --dport 22 -j ACCEPT
iptables -A OUTPUT -s 130.15.0.0/16 -p TCP --dport 22 -j ACCEPT
iptables -A OUTPUT -s 10.0.0.0/8 -p TCP --dport 22 -j ACCEPT
iptables -A OUTPUT -s 172.16.0.0/12 -p TCP --dport 22 -j ACCEPT
iptables -A OUTPUT -s 192.168.0.0/16 -p TCP --dport 22 -j ACCEPT

# Enable HTTP[S]
iptables -A INPUT -p TCP --dport 80 -j ACCEPT
iptables -A INPUT -p TCP --dport 443 -j ACCEPT
iptables -A OUTPUT -p TCP --dport 80 -j ACCEPT
iptables -A OUTPUT -p TCP --dport 443 -j ACCEPT

# Allow 130.15.100.100 to connect to mysql on 3306
iptables -A INPUT -p TCP -s 130.15.100.100 --dport 3306 -j ACCEPT
iptables -A OUTPUT -p TCP -s 130.15.100.100 --dport 3306 -j ACCEPT

# Explicity allow connections out from 130.15.0.0 to 130.15.255.255
iptables -A OUTPUT -p TCP -s 130.15.0.0/16 -j ACCEPT

# Drop any other outgoing TCP traffic
iptables -A INPUT -p TCP -j DROP
iptables -A FORWARD -p TCP -j DROP
iptables -A OUTPUT -p TCP -j DROP

echo "I was still able to connect because I gave my VM a local IP address (192.168.0.5)."

