# 🔧 Linux Utilities: Log Analyzer & System Monitor

A collection of **two Bash scripts** for DevOps and system administration:  
1. `log_analyzer.sh` → Analyze log files  
2. `sys_monitor.sh` → Monitor system resources  

---

## 📂 Scripts Included

### 1️⃣ `log_analyzer.sh` – Log File Analyzer
A script to parse and analyze application/system log files.  
It summarizes errors, warnings, and usage statistics.

#### Features:
- ✅ Counts total log lines  
- ✅ Shows counts of **Errors, Warnings, and Info**  
- ✅ Displays **Top 10 frequent errors**  
- ✅ Displays **Last 10 errors**  
- ✅ Shows **Errors per day** (if logs have `YYYY-MM-DD` format)

#### Usage:
```bash
chmod +x log_analyzer.sh
./log_analyzer.sh <file_path>



### 2️⃣ `sys_monitor.sh` – System Monitoring Tool
A script to monitor **system health and resource usage** in real-time.  
It summarizes memory, disk, CPU usage, uptime, and top processes.  

#### Features:
- ✅ Displays **Memory usage** (used / free / total in MB)  
- ✅ Shows **Disk usage** (used / total / percentage)  
- ✅ Prints **System uptime**  
- ✅ Lists **Top 5 CPU-consuming processes**  
- ✅ Shows **CPU usage percentage**  

#### Usage:
```bash
chmod +x sys_monitor.sh
./sys_monitor.sh
