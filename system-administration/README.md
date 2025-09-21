# Shell Scripting Tools by Vaibhav Umbarkar

This repository contains two Bash scripts for system monitoring and log analysis.

---

## 1. Log Analyzer Script (`log_analyzer.sh`)

**Author:** Vaibhav Umbarkar  
**Version:** v1.0  
**Description:** Parses log files to summarize errors, warnings, and usage statistics.

### Features

- Counts total lines in a log file.
- Displays the number of Errors, Warnings, and Information messages.
- Shows the top 10 most frequent errors.
- Displays errors per day (if the log contains standard dates in `YYYY-MM-DD` format).
- Shows the last 10 errors.

### Usage

```bash
./log_analyzer.sh <file_path>




# 2. System Monitor Script (`sys_monitor.sh`)

**Author:** Vaibhav Umbarkar  
**Version:** v1.0  
**Description:** Lightweight system monitoring script that reports memory, disk, uptime, CPU usage, and the top CPU-consuming processes.

### Features

- Memory usage summary (total, used, free).
- Disk usage for root filesystem.
- Human-readable system uptime.
- Top 5 CPU-consuming processes.
- Estimated total CPU usage.

### Requirements

- Linux or WSL (script uses standard Linux utilities).
- Bash shell.
- Installed utilities: free, df, uptime, ps, top, awk, grep, head (typically present in most Linux distros).

### Installation

Make the script executable:

```bash
chmod +x sys_monitor.sh
```

Place it in a directory on your PATH or run it from the repository:

```bash
./sys_monitor.sh
```

### Usage

Run without arguments:

```bash
./sys_monitor.sh
```

Sample output (example):
```
------------------------------------------
        System Monitoring Report
------------------------------------------
1. Memory Usage: 3.2 GB / Total: 7.8 GB (Free: 4.6 GB)
3. System Uptime: up 2 hours, 15 minutes
2. Disk Usage: 12G used out of 50G (24% used)
4. Top 5 CPU-consuming processes:
  PID COMMAND %CPU
 1234 python 12.3
 2345 chrome 8.1
 3456 java 5.0
 4567 node 3.2
 5678 bash 0.7
5. CPU Usage: 15%
```

### Notes and Caveats

- The script parses command output; formatting may vary across distributions and versions of tools (especially `top` and `free`). Adjust parsing if values appear incorrect on your system.
- The memory values displayed use `free -h` output; units (GB, MiB) are preserved as returned by the system.
- CPU usage calculation is an approximation (derived from `top` output) and may differ from other monitoring tools.

### Contributing

- Report issues or suggest improvements via repository issues.
- Pull requests should include clear descriptions and, if applicable, adjustments for different Linux distributions.

---
