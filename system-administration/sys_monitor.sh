#!/bin/bash

###############################################
# Author: Vaibhav Umbarkar
# Version: v1.0
# Description: System Monitoring Tool
###############################################


# Function to display memory usage in MB
memory_usage(){
    mem_total=$(free -h | awk '/Mem:/ {print $2}')
    mem_used=$(free -h | awk '/Mem:/ {print $3}')
    mem_free=$(free -h | awk '/Mem:/ {print $4}')

    echo "1. Memory Usage: $mem_used GB / Total: $mem_total GB (Free: $mem_free GB)"
}

# Function to display disk usage
disk_usage(){
    disk=$(df -h / | awk 'NR==2 {print $3 " used out of " $2 "(" $5 " used)"}')
    echo "2. Disk Usage: $disk"
}

# Function to display System Uptime
system_uptime(){
    uptime_info=$(uptime -p)

    echo "3. System Uptime: $uptime_info"
}

# Function to display top 5 processes by CPU
top_processes(){
    echo "4. Top 5 CPU-consuming processes:"
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
}

# Function to display CPU usage
cpu_usage(){
    cpu_idle=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | cut -d'.' -f1)
    cpu_used=$((100 - cpu_idle))

    echo "5. CPU Usage: $cpu_used%"
} 


echo "------------------------------------------"
echo "        System Monitoring Report"
echo "------------------------------------------"

# Call Memory Usage Function
memory_usage

# Call System Uptime Function
system_uptime

# Call Disk Usage Function
disk_usage

# Call Top 5 Processes Function
top_processes

# Call CPU Usage Function
cpu_usage