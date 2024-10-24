#!/bin/bash

# List all the ips for a given network prefix.
# /24 only

# Usage: bash IPList.bash 10.0.17
[ "$#" -lt  1 ] && echo "Usage: $0 <prefix>" && exit 1

# Prefix is the first input taken.
prefix="$1"

# Verify info link
[ "${#prefix}" -lt 5 ] && \
printf "Prefix length is too short\nPrefix example: 10.0.17\n" && \
exit 1

for i in {1..255}
do
	ping -c 1 "$prefix.$i" | grep "64 bytes from" | \
	grep -o -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"
done
