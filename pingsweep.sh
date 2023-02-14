#!/bin/bash
# Shebang

#displaying lines of text or string which are passed as arguments on the command line

echo "Enter Subnet:"

#read is a bash built-in command that reads a line from the standard input

read SUBNET

for IP in $(seq 1 254); do
	ping -c 1 $SUBNET.$IP | grep "64 bytes" | cut -d "" -f 4 | tr -d ":" &
done

# The grep command output lists only the host IP that matches the "64 bytes" pattern
# [Because when a host is alive it shows "64 bytes" from certain IP othrwise "Host not reachable", so grep will matches only those IP's that are alive.]

# Now to narrow the grep output further to show only the host IP address. To do that, 
# we can use the cut command with a space delimiter -d and a field -f of that space set to 4 and to remove “:” we can use the translate tr parameter with a delimiter -d “:”


# seq 1 254 =  sequence starting from 1 to 254

# -c 1 = count 1 

# $SUBNET = user subnet input [the first 3 octets of the network in this case]

# .$IP = the sequence starting with 1 to 254

# -d = delimiter

# tr = translate

# & = allows multithreading i.e ping all the IPs at once.
