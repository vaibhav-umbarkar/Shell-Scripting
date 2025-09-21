#!/bin/bash

##############################################
# Author: Vaibhav Umbarkar
# Version: v1.0
# Description: Parser log files to summarize error, warnnings, and usage stats.
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

# Function for display top 10 errors
show_top_errors(){
    echo "2. Top 10 frequnt errors:"
    grep -i "error" "$LOGFILE" | sort | uniq -c | sort -nr | head -10
}

# Function for display last 10 errors
show_last_errors(){
    echo "3. Last 10 errors"
    grep -i "error" "$LOGFILE" | tail -10
}

# Function for display error as per day
show_error_per_day(){
    if grep -qE "[0-9]{4}-[0-9]{2}-[0-9]{2}" "$LOGFILE"
    then
        echo "4. Errors per day:"
        grep -i "error" "$LOGFILE" | awk '{print $1}' | sort | uniq -c | sort -nr
    else
        echo "Log dose not have standart date YYYY-MM-DD"
    fi
}


echo "---------------------------------------------------------------"
echo "               Analyzing log file: $LOGFILE"
echo "---------------------------------------------------------------"

# Call Functions
count_total_line
count_log_level
echo "---------------------------------------------------------------"
show_top_errors
echo "---------------------------------------------------------------"
show_error_per_day
echo "---------------------------------------------------------------"
show_last_errors