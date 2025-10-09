# Log Analyzer Script

<<<<<<< HEAD
A simple Bash script to parse log files and provide summarized statistics including error, warnings and info messages counts, Top frequent errors and Latest 10 errors
=======
This Bash script to parse log files and provide summarized statistics including error counts, warnings, info messages, top frequent errors, and errors per day.
>>>>>>> 10ea74e7a932d8a462b3efd70bc86e75f2508fc8

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
