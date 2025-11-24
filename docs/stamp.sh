#!/bin/bash
# stamp.sh - Debian-only step verification
# Author: SM

t=$(date +"%Y-%m-%d %H:%M:%S %Z")    # Readable timestamp
u=$(whoami)
upt=$(cut -d. -f1 /proc/uptime)      # Kernel uptime in seconds

# Use sha256sum, fallback to md5sum if needed
hashcmd=$(command -v sha256sum || command -v md5sum)
h=$(echo -n "${u}_${t}_${upt}" | $hashcmd | awk '{print $1}')

echo "$u | $t | uptime:${upt}s | check:${h: -6}"
