## Log Analyzer Script (Bash + Linux)

A simple Bash script to parse log files and provide summarized statistics including error, warnings and info messages counts, Top frequent errors and Latest 10 errors

---

## Description

`log_analyzer.sh` is designed to help you analyze log files quickly. The script provides:

- Total number of lines in the log file.
- Count of **Errors**, **Warnings**, and **Information** messages.
- Top 10 most frequent error messages.
- Last 10 errors in the log file.

---

## Usage

```bash
./log_analyzer.sh <file_path>
