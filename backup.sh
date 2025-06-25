#!/bin/bash


SOURCE_DIR="/home/alihamza/Documents/shellprac/script/auto-script"
BACKUP_DIR="/home/alihamza/Documents/backups"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVE_NAME="auto-script-backup-$DATE.tar.gz"

mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" -C "$SOURCE_DIR" .

if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_DIR/$ARCHIVE_NAME"
else
    echo "Backup failed."
fi

