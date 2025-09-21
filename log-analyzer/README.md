# Log Analyzer Script

A simple Bash script to parse log files and provide summarized statistics including error counts, warnings, info messages, top frequent errors, and errors per day.

---

## Author

**Vaibhav Umbarkar**  
Version: v1.0  

---

## Description

`log_analyzer.sh` is designed to help you analyze log files quickly. The script provides:

- Total number of lines in the log file.
- Count of **Errors**, **Warnings**, and **Information** messages.
- Top 10 most frequent error messages.
- Errors grouped by day (if log uses the format `YYYY-MM-DD`).
- Last 10 errors in the log file.

---

## Usage

```bash
./log_analyzer.sh <file_path>
