#!/bin/bash
# =============================================================
# Script 4: Log File Analyzer
# Author  : [Your Name] | Roll No: [Roll Number]
# Course  : Open Source Software (OSS NGMC)
# Purpose : Read a log file line by line, count occurrences of
#           a keyword, and print a summary with the last 5
#           matching lines.
# Usage   : ./script4_log_analyzer.sh <logfile> [keyword]
# Example : ./script4_log_analyzer.sh /var/log/syslog error
# =============================================================

# --- Accept command-line arguments ---
# $1 is the log file path passed by the user
LOGFILE=$1

# $2 is the search keyword; default to "error" if not provided
KEYWORD=${2:-"error"}

# Counter variable to track how many matching lines are found
COUNT=0

echo "========================================================"
echo "  Log File Analyzer"
echo "  File    : ${LOGFILE:-[not provided]}"
echo "  Keyword : $KEYWORD"
echo "========================================================"
echo ""

# --- Validate that a file path was actually given ---
if [ -z "$LOGFILE" ]; then
    echo "ERROR: No log file specified."
    echo "Usage: $0 <logfile> [keyword]"
    echo ""
    echo "Common log files to try:"
    echo "  /var/log/syslog       (Ubuntu/Debian)"
    echo "  /var/log/messages     (Fedora/RHEL)"
    echo "  /var/log/kern.log     (kernel messages)"
    exit 1
fi

# --- Validate that the specified file exists and is readable ---
if [ ! -f "$LOGFILE" ]; then
    echo "ERROR: File '$LOGFILE' not found."
    echo ""
    # Suggest alternative log files based on what exists
    echo "Checking for available log files on this system..."
    for ALTLOG in /var/log/syslog /var/log/messages /var/log/kern.log /var/log/dmesg; do
        if [ -f "$ALTLOG" ]; then
            echo "  Found: $ALTLOG  (try using this instead)"
        fi
    done
    exit 1
fi

# --- Check if the file is empty and handle it gracefully ---
if [ ! -s "$LOGFILE" ]; then
    echo "WARNING: The file '$LOGFILE' is empty. Nothing to analyse."
    exit 0
fi

echo "Scanning file... please wait."
echo ""

# --- While-read loop: read the log file one line at a time ---
# IFS= prevents stripping of leading/trailing whitespace
# -r prevents backslash interpretation
while IFS= read -r LINE; do

    # if-then: check if this line contains the keyword (case-insensitive)
    # grep -i = case-insensitive, -q = quiet (no output, just return code)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment counter by 1
    fi

done < "$LOGFILE"   # Redirect the file as input to the while loop

# --- Print summary results ---
echo "========================================================"
echo "  Scan Complete"
echo "========================================================"
echo ""
echo "  Log File    : $LOGFILE"
echo "  Keyword     : '$KEYWORD'"
echo "  Total lines : $(wc -l < "$LOGFILE")"
echo "  Matches     : $COUNT"
echo ""

# Only show matching lines if any were found
if [ "$COUNT" -gt 0 ]; then
    echo "Last 5 lines containing '$KEYWORD':"
    echo "--------------------------------------------"
    # grep -i = case-insensitive; tail -5 = last 5 results
    grep -i "$KEYWORD" "$LOGFILE" | tail -5
    echo ""
else
    echo "No lines containing '$KEYWORD' were found in $LOGFILE."
    echo "Try a different keyword, e.g.: error, warning, fail, denied"
fi

echo ""
