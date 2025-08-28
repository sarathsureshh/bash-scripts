#!/bin/bash

# === USAGE ===
# ./clean_apple_metadata.sh /path/to/drive true /path/to/logfile.log

TARGET_DIR="${1:-/Volumes/ExternalDrive}"
DRY_RUN="${2:-true}" 
LOG_FILE="${3:-$HOME/apple_metadata_cleanup.log}"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

delete_file() {
    local file="$1"
    if [ "$DRY_RUN" = true ]; then
        log "Would delete: $file"
    else
        rm -f "$file" && log "Deleted: $file"
    fi
}

scan_and_clean() {
    log "Scanning $TARGET_DIR for Apple metadata files..."
    find "$TARGET_DIR" \( -name ".DS_Store" -o -name "._*" \) -type f | while read -r file; do
        delete_file "$file"
    done
    log "Scan complete."
}

# === EXECUTION ===
log "=== Apple Metadata Cleanup Started ==="
log "Target Directory: $TARGET_DIR"
log "Dry Run Mode: $DRY_RUN"
log "Log File: $LOG_FILE"
scan_and_clean
log "=== Cleanup Finished ==="
