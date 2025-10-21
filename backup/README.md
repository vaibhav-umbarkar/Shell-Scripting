# System & Application Log Backup (Bash + AWS S3)

Bash script to **automate backups of system or application logs** and store them securely in an **Amazon S3 bucket**.  
This helps maintain centralized, long-term log storage for compliance, monitoring, and disaster recovery.

---

## Prerequisites

- **Linux / macOS / WSL** environment  
- **Bash** shell  
- **AWS CLI v2** installed and configured  
  - Check installation: `aws --version`  
  - Configure using: `aws configure`  
- **IAM Role or User** with the following minimum permissions:
  ```json
  {
    "Effect": "Allow",
    "Action": [
      "s3:PutObject",
      "s3:PutObjectAcl"
    ],
    "Resource": "*"
  }
