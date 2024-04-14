#!/bin/bash

LOG_FILE="/var/log/syslog"

if [ ! -f "$LOG_FILE" ] || [ ! -r "$LOG_FILE" ]; then
    echo "Error: Log file '$LOG_FILE' does not exist or is not readable"
    exit 1
fi

ERRORS=$(grep "error" "$LOG_FILE")

ERRORS=$(echo "$ERRORS" | sed -e "s/.*error: //" -e "s/ at .*$//")

E_COUNT=$(echo "$ERRORS" | wc -l)

echo "Found $E_COUNT errors:"
echo "$ERRORS" > errors.txt
