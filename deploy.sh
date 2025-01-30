#!/bin/bash
cd /home/ubuntu/my-app/
sudo apt update -y

# Log in to AWS ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 270514764245.dkr.ecr.us-east-1.amazonaws.com

docker pull 270514764245.dkr.ecr.us-east-1.amazonaws.com/aura-app:latest

docker pull 270514764245.dkr.ecr.us-east-1.amazonaws.com/aura-payroll:latest
