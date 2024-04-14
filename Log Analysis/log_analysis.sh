#!/bin/bash

# Define the log file
LOG_FILE="/var/log/syslog"

# Check if the log file exists and is readable
if [ ! -f "$LOG_FILE" ] || [ ! -r "$LOG_FILE" ]; then
    echo "Error: Log file '$LOG_FILE' does not exist or is not readable"
    exit 1
fi

# Search for errors in the log file
ERRORS=$(grep "error" "$LOG_FILE")

# Filter out irrelevant data
ERRORS=$(echo "$ERRORS" | sed -e "s/.*error: //" -e "s/ at .*$//")

# Count the number of errors
E_COUNT=$(echo "$ERRORS" | wc -l)

# Display the results
echo "Found $E_COUNT errors:"
echo "$ERRORS" > errors.txt
