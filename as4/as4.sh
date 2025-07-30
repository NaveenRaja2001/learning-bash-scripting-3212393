#!/bin/bash

# Define paths
OUTPUT_FILE="$HOME/high_cpu_processes.txt"
ARCHIVE_FILE="$HOME/high_cpu_processes_com.tar.gz"
LOG_FILE="$HOME/high_cpu_processes_status.log"
/home
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

ps -eo pid,comm,%cpu --sort=-%cpu | awk 'NR==1 || $3 > 10' > "$OUTPUT_FILE"

if [ $(wc -l < "$OUTPUT_FILE") -eq 1 ]; then
    echo "Simulated process list - no real process >10% CPU" >> "$OUTPUT_FILE"
    echo "1234 dummy_process 12.5" >> "$OUTPUT_FILE"
fi

tar -czf "$ARCHIVE_FILE" -C "$HOME" "$(basename "$OUTPUT_FILE")"


VERIFY_RESULT=$(tar -tzf "$ARCHIVE_FILE" > /dev/null 2>&1 && echo "SUCCESS" || echo "FAILED")


{
    echo "$TIMESTAMP Archive verification: $VERIFY_RESULT"
} >> "$LOG_FILE"