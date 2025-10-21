#!/bin/bash

##################################################################
# Author: Vaibhav Umbarkar
# Version: v1.0
# Description: Backups of system or application logs with given source and destination
##################################################################

LOG_DIR="/var/log/my_app"
S3_BUCKET="s3://my_bucket"
TIMESTAMP=$(date+"%Y-%m-%d_%H-%M-%S")

tar -czf /tmp/logs_$TIMESTAMP.tar.gz $LOG_DIR
aws s3 cp /tmp/logs_$TIMESTAMP.tar.gz $S3_BUCKET/logs/
rm /tmp/logs_$TIMESTAMP.tar.gz