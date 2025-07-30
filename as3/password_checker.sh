#!/bin/bash

# Log file
LOG_FILE="./password_check_result.log"

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
USER_NAME=$(whoami)

write_log() {
    echo "$TIMESTAMP [$USER_NAME]"
    if [ ${#MISSING_CRITERIA[@]} -eq 0 ]; then
        echo "[STRONG] Password is strong."
    else
        echo "[WEAK] Password is weak."
        echo "Missing:"
        for crit in "${MISSING_CRITERIA[@]}"; do
            echo "$crit"
        done
    fi
    echo "------------------------------"
}

if [ $# -ne 1 ]; then
    echo "Usage: $0 <password>" >&2
    exit 1
fi

PASSWORD="$1"
MISSING_CRITERIA=()

#checks
[[ ${#PASSWORD} -lt 8 ]] && MISSING_CRITERIA+=("- Minimum 8 characters")
[[ ! "$PASSWORD" =~ [A-Z] ]] && MISSING_CRITERIA+=("- At least one uppercase letter")
[[ ! "$PASSWORD" =~ [a-z] ]] && MISSING_CRITERIA+=("- At least one lowercase letter")
[[ ! "$PASSWORD" =~ [0-9] ]] && MISSING_CRITERIA+=("- At least one number")
[[ ! "$PASSWORD" =~ [\!\@\#\$\%\^\&\*\(\)\-\_\+\=] ]] && MISSING_CRITERIA+=("- At least one special character (!@#$%^&*()-_+=)")

write_log >> "$LOG_FILE"