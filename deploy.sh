#!/bin/bash
cd /home/ubuntu/my-app/
sudo apt update -y
# sudo apt install unzip -y 
# curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
# unzip awscliv2.zip
# sudo ./aws/install

# Log in to AWS ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 270514764245.dkr.ecr.us-east-1.amazonaws.com

# IMAGE_TAG=$(aws ssm get-parameter --name "backend-image-tag" --region ap-south-1 --query "Parameter.Value" --output text)

docker rm -f 270514764245.dkr.ecr.us-east-1.amazonaws.com/aura-app:latest || true

docker pull 270514764245.dkr.ecr.us-east-1.amazonaws.com/aura-app:latest
