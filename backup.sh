#!/bin/bash

SRC_DIR="/path/to/source/directory"
DST_DIR="/path/to/backup/directory"

# Check if source directory exists
if [ ! -d "$SRC_DIR" ]; then
    echo "Error: Source directory does not exist"
    exit 1
fi

# Check if destination directory exists, create it if not
if [ ! -d "$DST_DIR" ]; then
    mkdir -p "$DST_DIR"
fi

# Copy only files from source to destination
for file in "$SRC_DIR"/*; do
    if [ -f "$file" ]; then
        cp "$file" "$DST_DIR"
    fi
done

echo "Backup completed successfully"
