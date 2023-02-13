#!/bin/bash

echo "Enter Subnet:"
read SUBNET

for IP in $(seq 1 254); do
	ping -c 1 $SUBNET.$IP | grep "64 bytes" | cut -d "" -f 4 | tr -d ":"&
done



