#!/bin/bash
############################################
#Version: 01
#
#This Script will list the AWS resources usage
#
# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users
#############################################

#list s3 buckets
echo "Print list of S3 Buckets" > AWS_DEV_Resource_Tracker.csv
aws s3 ls >>

#list EC2 Instance
echo "Print list of EC2 Instances"
#aws ec2 describe-instances

aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' # jq JSON command to fetch only the instance id from the output

#list lamba
echo "Print list of Lambda Functions"
aws lambda list-functions

#list IAM users
echo "Print list of IAM users"
#aws iam list-users

aws iam list-users | jq '.Users[].UserName' # jq JSON command to fetch only Username from iam list user command
