# AWS Resources Script

A simple Bash script to **list AWS resources** for a given service and region. This script helps you quickly view your AWS account resources using the AWS CLI.

---

## Prerequisites

- **Linux / macOS / WSL** environment  
- **Bash** shell  
- **AWS CLI v2** installed and configured  
  - Check installation: `aws --version`  
  - Configure using: `aws configure`  
- AWS credentials and default region must be set in `~/.aws/`

---

## Supported AWS Services

The script currently supports listing resources for:

- EC2
- RDS
- S3
- CloudFront
- VPC
- IAM
- Route53
- CloudWatch
- CloudFormation
- Lambda
- SNS
- SQS
- DynamoDB
- EBS

---

## Usage

```bash
./aws_resources.sh <aws_region> <aws_service>
