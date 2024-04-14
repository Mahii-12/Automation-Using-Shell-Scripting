#!/bin/bash

SRC_DIR="/var/my_files/doc"
DST_DIR="/new_files/backup"

if [ ! -d "$SRC_DIR" ]; then
    echo "Error: Source directory does not exist"
    exit 1
fi

if [ ! -d "$DST_DIR" ]; then
    mkdir -p "$DST_DIR"
fi

for file in "$SRC_DIR"/*; do
    if [ -f "$file" ]; then
        cp "$file" "$DST_DIR"
    fi
done

echo "Backup completed successfully"
