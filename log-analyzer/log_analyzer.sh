#!/bin/bash

##############################################
# Author: Vaibhav Umbarkar
# Version: v1.0
# Description: Parser log files to summarize error, warnings, and usage stats.
##############################################


# Check if log file is provided
if [ -z "$1" ]
then
    echo "Usage: ./log.analyzer.sh <file_path>"
    exit 1
fi

LOGFILE=$1

if [ ! -f "$LOGFILE" ]
then
    echo "Error: File $LOGFILE dose not exist"
    exit 1
fi

# Function for calc lines
count_total_line(){
    echo "1. Total lines: $(wc -l < "$LOGFILE") lines"
}

# Function for display Error, Warning and Info count
count_log_level(){
    echo "Errors: $(grep -i "error" "$LOGFILE" | wc -l)"
    echo "Warnings: $(grep -i "warn " "$LOGFILE" | wc -l)"
    echo "Information: $(grep -i "info" "$LOGFILE" | wc -l)"
}

# Function for display latest 10 errors
show_latest_errors(){
    echo "3. Latest 10 errors"
    grep -i "error" "$LOGFILE" | tail -10
}

# Function for display top 10 errors
show_top_errors(){
    echo "2. Top 10 frequnt errors:"
    grep -i "error" "$LOGFILE" | sort | uniq -c | sort -nr | head -10
}


echo "---------------------------------------------------------------"
echo "               Analyzing log file: $LOGFILE"
echo "---------------------------------------------------------------"

# Call Functions
count_total_line
count_log_level
echo "---------------------------------------------------------------"
show_latest_errors
echo "---------------------------------------------------------------"
show_top_errors