#!/bin/bash
set -e

export RESTIC_REPOSITORY="rest:http://<RESTIC_USER>:<RESTIC_PASSWORD>@<BACKUP_SERVER_IP>:8000/"
export RESTIC_PASSWORD_FILE="<PATH_TO_RESTIC_PASSWORD_FILE>"

RESTORE_DIR="/home/user/recovery-test"
LOG_FILE="/home/user/restore-test.log"

mkdir -p "$RESTORE_DIR"

echo "[$(date)] Restore started" >> "$LOG_FILE"

restic restore latest --target "$RESTORE_DIR" >> "$LOG_FILE" 2>&1

if [ -f "$RESTORE_DIR/opt/portfolio-data/test.txt" ]; then
    echo "[$(date)] Restore successful" >> "$LOG_FILE"
else
    echo "[$(date)] Restore failed" >> "$LOG_FILE"
    exit 1
fi
