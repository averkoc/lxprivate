#!/bin/bash
# Simple Apache access.log analyzer
# Usage: ./analyze-access.sh

LOGFILE="${HOME}/access.log"

echo "=== Apache Access Log Summary ==="
echo "Logfile: $LOGFILE"
echo

# Total requests
REQS=$(wc -l < "$LOGFILE")
echo "Total requests: $REQS"

# Status codes
echo
echo "--- HTTP Status Codes ---"
awk '{print $9}' "$LOGFILE" | sort | uniq -c | sort -nr

# Top 10 URLs
echo
echo "--- Top 10 Requested URLs ---"
awk '{print $7}' "$LOGFILE" | sort | uniq -c | sort -nr | head -10

# Top 10 IPs
echo
echo "--- Top 10 Client IPs ---"
awk '{print $1}' "$LOGFILE" | sort | uniq -c | sort -nr | head -10

# Bandwidth usage
echo
echo "--- Bandwidth Usage ---"
awk '{sum+=$10} END {print "Total:", sum, "bytes (≈", sum/1024/1024, "MB)"}' "$LOGFILE"

# Requests by minute (top 10 busiest minutes)
echo
echo "--- Top 10 Busiest Minutes ---"
awk '{print substr($4, 2, 17)}' "$LOGFILE" | sort | uniq -c | sort -nr | head -10

# Top 10 User Agents
echo
echo "--- Top 10 User Agents ---"
awk -F\" '{print $6}' "$LOGFILE" | sort | uniq -c | sort -nr | head -10

echo
echo "=== End of Report ==="
