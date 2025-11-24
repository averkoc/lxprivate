#!/bin/bash
# Author:SM
# Function: Verify exercise steps
# Comment:Intentionally obscure

a=$(date)
b=${a// /_}

USER=$(whoami)

if command -v md5 > /dev/null; then
    # macOS
    HASH1=$(echo -n "$b" | md5)
    HASH2=$(echo -n "$USER{HASH1: -2}" | md5)
else
    # Linux
    HASH1=$(echo -n "$b" | md5sum | awk '{print $1}')
    HASH2=$(echo -n "$USER${HASH1: -2}" | md5sum | awk '{print $1}')

fi

echo "$USER completed the step at:$a check:${HASH1: -4} ${HASH2: -4}"
