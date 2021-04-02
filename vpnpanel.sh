#!/bin/bash

ip=$( ip a | grep tun0 | grep inet | cut -d " " -f 6 | cut -d "/" -f 1 )
if [ -z "$ip" ]; 
then 
	ip="VPN: disconnected" 
else 
	ip="VPN: $ip" 
fi
echo $ip
